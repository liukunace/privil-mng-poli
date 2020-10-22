package io.renren.modules.sys.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import java.net.URLEncoder;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.*;
import io.renren.modules.sys.service.SysDepartmentService;
import io.renren.modules.sys.service.SysProjectService;
import io.renren.modules.sys.service.SysUserDepartmentService;
import io.renren.modules.sys.service.SysUserService;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @author: liukun
 * @create: 2020-09-07 18:37
 */
@RestController
@RequestMapping("/exc")
public class SysExcelUtilController extends AbstractController{

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysDepartmentService sysDepartmentService;

    @Autowired
    private SysUserDepartmentService sysUserDepartmentService;

    @Autowired
    private SysProjectService sysProjectService;

    /**
     * 导入Excel数据，解析表单映射，本地测试
     *
     * @param file 文件
     * @param sheetName sheet名称
     * @throws Exception
     */
    @PostMapping("/person")
    public R resolvingExcel(@RequestParam("file") MultipartFile file, @RequestParam("sheetName") String sheetName) throws Exception {
        Map<String, Object> list = new HashMap<String, Object>();
        list.put("userList",resolvingExcelBase(file,   sheetName));
        return R.ok().put("list", list);
    }

    @PostMapping("/proj/exp")
    public void exportProjExcel(HttpServletResponse response){
        String fileName="项目列表导入模板.xlsx";
        List list=new ArrayList<>();
        for(int i=1;i<2;i++){
            SysDingProjectEntity p=new SysDingProjectEntity(344863619L,"XXX项目","909090","备注XXX");
            list.add(p);
        }
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(null,"sheet1"), SysDingProjectEntity.class, list);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @PostMapping("/dept/exp")
    public void exportDeptExcel(HttpServletResponse response){
        String fileName="部门列表导入模板.xlsx";
        List list=new ArrayList<>();
        for(int i=1;i<2;i++){
            SysDingDepartmentEntity p=new SysDingDepartmentEntity(344863619L,"市场营销部","scyxb",1L);
            list.add(p);
        }
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(null,"sheet1"), SysDingDepartmentEntity.class, list);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @PostMapping("/exp")
    public void exportExcel(HttpServletResponse response){
        String fileName="用户列表导入模板.xlsx";
        List list=new ArrayList<>();
        for(int i=1;i<2;i++){
            SysDingUserEntity p=new SysDingUserEntity("测试"+i,"12085808023232323","项目X部","344863619","17633330682","test@12.cc");
            list.add(p);
        }
        //新增一行title内容
        //Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("个人信息", "person"), SysDingUserEntity.class, list);
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(null,"sheet1"), SysDingUserEntity.class, list);
        try {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("content-Type", "application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 项目批量导入
     * @param file
     * @param sheetName
     * @return
     * @throws Exception
     */
    @PostMapping("/project/imp")
    public R resolvingProjectExcelImp(@RequestParam("file") MultipartFile file, @RequestParam("sheetName") String sheetName) throws Exception {
        int count=0;
        int fail=0;
        List<Object> list =resolvingExcelBase( file, sheetName);
        for(int i=0;i<list.size();i++){
            List<String> listSub = castList(list.get(i), String.class);
            SysProjectEntity project = sysProjectService.queryProjectByName(listSub.get(1));
            if(project!=null){
                fail++;
            }else{
                project=new SysProjectEntity();
                project.setProjectName(listSub.get(1));
                project.setRemark(listSub.get(2));
                project.setCreateUserId(1L);
                sysProjectService.save(project);
                count++;
            }
        }
        return R.ok().put("status", "导入成功"+count+"条,失败"+fail+"条(重复)");
    }

    /**
     * 部门导入
     * @param file
     * @param sheetName
     * @return
     * @throws Exception
     */
    @PostMapping("/dept/imp")
    public R resolvingDeptExcelImp(@RequestParam("file") MultipartFile file, @RequestParam("sheetName") String sheetName) throws Exception {
        int count=0;
        int fail=0;
        int update=0;
        List<Object> list =resolvingExcelBase( file, sheetName);
        for(int i=0;i<list.size();i++){
            List<String> listSub = castList(list.get(i), String.class);
            //343073673	,党政办公室（人大办公室）	, a01,	1
            //根据名称获取部门
            SysDepartmentEntity dept = sysDepartmentService.queryDeptByLabel(listSub.get(1));
            if(dept!=null){
                //获取当前pid对应的父级及id
                SysDepartmentEntity deptSub = sysDepartmentService.queryDeptByDingId(listSub.get(3));
                if(deptSub!=null ){//&& deptSub.getDeptId()!=dept.getPId() || dept.getDingId()!=null || !dept.getDingId().equals(listSub.get(0))
                    dept.setPId(deptSub.getDeptId());
                    dept.setDingId(listSub.get(0));
                    dept.setRankn(Integer.valueOf(listSub.get(4)));
                    sysDepartmentService.saveOrUpdate(dept);
                    update++;
                }else{
                    fail++;
                }
            }else{
                dept=new SysDepartmentEntity();
                //String b1 = listSub.get(0).substring(0,listSub.get(0).length()-2);
                //dept.setDingId(Long.parseLong(b1));
                dept.setDingId(listSub.get(0));
                dept.setLabel(listSub.get(1));
                dept.setValue(getFirstPinYin(listSub.get(1)));
                if(!listSub.get(3).equals("") && !listSub.get(3).equals("0")){
                    SysDepartmentEntity deptSub = sysDepartmentService.queryDeptByDingId(listSub.get(3));
                    if(deptSub!=null){
                        dept.setPId(deptSub.getDeptId());
                    }
                    if(listSub.get(3).equals("0")){
                        dept.setPId(0L);
                    }
                }
                dept.setRankn(Integer.valueOf(listSub.get(4)));
                sysDepartmentService.save(dept);
                count++;
            }
        }
        return R.ok().put("status", "导入成功"+count+"条，更新"+update+"条，失败"+fail+"条(重复)");
    }

    @GetMapping("/dept/imp/syn")
    public R resolvingExcelDeptImpSyn(@RequestParam("deptStr") String deptStr) throws Exception {
        //deptStr=273480001,党建工作办公室,djgzbgs001,1(PID),rank(1)(int)
        String[] userDataString=deptStr.split(",");
        for(int i=0;i< userDataString.length;i++){
            SysDepartmentEntity dept = sysDepartmentService.queryDeptByLabel(userDataString[1]);
            if(dept!=null){
                //获取当前pid对应的父级及id
                SysDepartmentEntity deptSub = sysDepartmentService.queryDeptByDingId(userDataString[3]);
                if(deptSub!=null ){
                    dept.setDingId(userDataString[0]);
                    dept.setPId(deptSub.getDeptId());
                    dept.setRankn(Integer.valueOf(userDataString[4]));
                    sysDepartmentService.saveOrUpdate(dept);
                    return R.ok().put("status", true);
                }else{
                    return R.ok().put("status", false);
                }
            }else{
                dept=new SysDepartmentEntity();
                dept.setDingId(userDataString[0]);
                dept.setLabel(userDataString[1]);
                dept.setValue(getFirstPinYin(userDataString[1]));
                if(!userDataString[3].equals("") && !userDataString[3].equals("0")){
                    SysDepartmentEntity deptSub = sysDepartmentService.queryDeptByDingId(userDataString[3]);
                    if(deptSub!=null){
                        dept.setPId(deptSub.getDeptId());
                    }
                    if(userDataString[3].equals("0")){
                        dept.setPId(0L);
                    }
                }
                dept.setRankn(Integer.valueOf(userDataString[4]));
                sysDepartmentService.save(dept);
                return R.ok().put("status", true);
            }
        }
        return R.ok().put("status", "异常");
    }

    /**
     * 用户导入
     * @param file
     * @param sheetName
     * @return
     * @throws Exception
     */
    @PostMapping("/person/imp")
    public R resolvingExcelImp(@RequestParam("file") MultipartFile file, @RequestParam("sheetName") String sheetName) throws Exception {
        int count=0;
        int fail=0;
        int update=0;
        List<Object> list =resolvingExcelBase( file, sheetName);
        for(int i=0;i<list.size();i++){
            List<String> listSub = castList(list.get(i), String.class);
            SysUserEntity user = sysUserService.queryUserByDingId(listSub.get(1));
            if(user!=null){
                SysDepartmentEntity deptsub=sysDepartmentService.queryDeptByLabel(listSub.get(2));
                List<Long> deptlist=sysUserDepartmentService.queryDeptIdList(user.getUserId());
                if(deptlist==null){
                    deptlist=new ArrayList<>();
                    if(!user.getDepartmentName().equals("")){
                        String[] deptDataString=user.getDepartmentName().split(",");
                        for(int j=0;j<deptDataString.length;j++){
                            SysDepartmentEntity dept=sysDepartmentService.queryDeptByLabel(user.getDepartmentName());
                            if(dept!=null){
                                deptlist.add(dept.getDeptId());
                            }
                        }
                    }
                }
                if(deptlist!=null && deptlist.contains(deptsub.getDeptId())){
                    fail++;
                }else{
                    deptlist.add(deptsub.getDeptId());
                    user.setDeptIdList(deptlist);
                    String deptName="";
                    if(deptlist.size()>=1){
                        for(int j=0;j<user.getDeptIdList().size();j++){
                            deptName+=sysDepartmentService.queryDeptById(user.getDeptIdList().get(j)).getLabel()+"，";
                        }
                        user.setDepartmentName(deptName.substring(0, deptName.length() -1));
                    }
                    sysUserService.update(user);
                    update++;
                }
            }else{
                user=new SysUserEntity();
                user.setDingName(listSub.get(0));
                SysUserEntity userT=sysUserService.queryByUserName(getAllPinyin(listSub.get(0)));
                if(userT!=null){
                    List<SysUserEntity> ulist=sysUserService.queryByDingName(listSub.get(0));
                    user.setUsername(userT.getUsername()+ulist.size());
                }else{
                    user.setUsername(getAllPinyin(listSub.get(0)));
                }
                user.setDingId(listSub.get(1));
                user.setDepartmentName(listSub.get(2));
                SysDepartmentEntity dept = sysDepartmentService.queryDeptByLabel(listSub.get(2));
                if(dept!=null){
                    List<Long> deptList=new ArrayList<>();
                    deptList.add(dept.getDeptId());
                    user.setDeptIdList(deptList);
                }
                Long l=Long.parseLong(listSub.get(3));
                List<Long> ll=new ArrayList<Long>();
                ll.add(l);
                user.setDeptIdList(ll);
                user.setMobile(listSub.get(4));
                user.setEmail(listSub.get(5));
                user.setStatus(1);
                sysUserService.saveDingUser(user);
                count++;
            }
        }
        return R.ok().put("status", "导入成功"+count+"条,失败"+fail+"条(重复),更新"+update+"条。");
    }

    @GetMapping("/person/imp/syn")
    public R resolvingExcelImpSyn(@RequestParam("userStr") String userStr) throws Exception {
        //String listSubStr = "0 PL逄增年,1--2342620946112303390（钉钉id）,2---党建工作办公室,3---273480001（部门ID）,4---13963908415";
        String[] userDataString=userStr.split(",");
        for(int i=0;i< userDataString.length;i++){
            SysUserEntity user = sysUserService.queryUserByDingId(userDataString[1]);
            if(user!=null){
                SysDepartmentEntity deptsub=sysDepartmentService.queryDeptByLabel(userDataString[2]);
                List<Long> deptlist=sysUserDepartmentService.queryDeptIdList(user.getUserId());
                if(deptlist==null){
                    deptlist=new ArrayList<>();
                    if(!user.getDepartmentName().equals("")){
                        String[] deptDataString=user.getDepartmentName().split(",");
                        for(int j=0;j<deptDataString.length;j++){
                            SysDepartmentEntity dept=sysDepartmentService.queryDeptByLabel(user.getDepartmentName());
                            if(dept!=null){
                                deptlist.add(dept.getDeptId());
                            }
                        }
                    }
                }
                if(deptlist!=null && deptlist.contains(deptsub.getDeptId())){
                    return R.ok().put("status", false);
                }else{
                    deptlist.add(deptsub.getDeptId());
                    user.setDeptIdList(deptlist);
                    String deptName="";
                    if(deptlist.size()>=1){
                        for(int j=0;j<user.getDeptIdList().size();j++){
                            deptName+=sysDepartmentService.queryDeptById(user.getDeptIdList().get(j)).getLabel()+"，";
                        }
                        user.setDepartmentName(deptName.substring(0, deptName.length() -1));
                    }
                    sysUserService.update(user);
                    return R.ok().put("status", true);
                }
            }else{
                user=new SysUserEntity();
                user.setDingName(userDataString[0]);
                SysUserEntity userT=sysUserService.queryByUserName(getAllPinyin(userDataString[0]));
                if(userT!=null){
                    List<SysUserEntity> ulist=sysUserService.queryByDingName(userDataString[0]);
                    user.setUsername(userT.getUsername()+ulist.size());
                }else{
                    user.setUsername(getAllPinyin(userDataString[0]));
                }
                user.setDingId(userDataString[1]);
                user.setDepartmentName(userDataString[2]);
                SysDepartmentEntity dept = sysDepartmentService.queryDeptByLabel(userDataString[2]);
                if(dept!=null){
                    List<Long> deptList=new ArrayList<>();
                    deptList.add(dept.getDeptId());
                    user.setDeptIdList(deptList);
                }
                Long l=Long.parseLong(userDataString[3]);
                List<Long> ll=new ArrayList<Long>();
                ll.add(l);
                user.setDeptIdList(ll);
                user.setMobile(userDataString[4]);
                //user.setEmail(listSub.get(5));
                user.setStatus(1);
                sysUserService.saveDingUser(user);
                return R.ok().put("status", true);
            }
        }
        return R.ok().put("status", "异常");
    }

    /**
     * 解析基类
     * @param file
     * @param sheetName
     * @return
     * @throws Exception
     */
    private List<Object> resolvingExcelBase(MultipartFile file, String sheetName) throws Exception {
        XSSFWorkbook wookbook = new XSSFWorkbook(file.getInputStream());
        XSSFSheet sheet = wookbook.getSheet(sheetName);
        //获取到Excel文件中的所有行数
        int rows = sheet.getPhysicalNumberOfRows();
        //遍历行
        XSSFRow rowColumn = sheet.getRow(0);
        int colNum=rowColumn.getLastCellNum();
        List<Object> columnsList1=new ArrayList<>();

        for (int i = 1; i < rows; i++) {
            // 读取左上端单元格
            XSSFRow row = sheet.getRow(i);
            // 行不为空
            if (row != null) {
                List<String> columnsList=new ArrayList<>();
                for(int j=0;j<colNum;j++){
                    XSSFCell columnCell = row.getCell(j);
                    String columnName = getValue(columnCell);
                    /* poi方式适用
                    NumberFormat nf = NumberFormat.getInstance();
                    HSSFCell cell= hssfRow.getCell(0);
                    String value = nf.format(cell.getNumericCellValue());
                    //这种方法对于自动加".0"的数字可直接解
                    // 但如果是科学计数法的数字就转换成了带逗号
                    if (value .indexOf(",") >= 0) {
                        value  = value .replace(",", "");
                    }
                     */
                    columnsList.add(columnName);
                }
                columnsList1.add(columnsList);
            }
        }
        return columnsList1;
    }

    private String getValue(XSSFCell xSSFCell) {
        if (null == xSSFCell) {
            return "";
        }
        if (xSSFCell.getCellType() == xSSFCell.CELL_TYPE_BOOLEAN) {
            // 返回布尔类型的值
            return String.valueOf(xSSFCell.getBooleanCellValue());
        } else if (xSSFCell.getCellType() == xSSFCell.CELL_TYPE_NUMERIC) {
            // 返回数值类型的值
            return String.valueOf(xSSFCell.getNumericCellValue());
        } else {
            // 返回字符串类型的值
            return String.valueOf(xSSFCell.getStringCellValue());
        }
    }

    //castList(listParam.get(i).get("columns"),String.class).get(k)
    private static <T> List<T> castList(Object obj, Class<T> clazz)
    {
        List<T> result = new ArrayList<T>();
        if(obj instanceof List<?>)
        {
            for (Object o : (List<?>) obj)
            {
                result.add(clazz.cast(o));
            }
            return result;
        }
        return null;
    }

    private String getFirstPinYin(String hanyu) {
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        format.setCaseType(HanyuPinyinCaseType.UPPERCASE);
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);

        StringBuilder firstPinyin = new StringBuilder();
        char[] hanyuArr = hanyu.trim().toCharArray();
        try {
            for (int i = 0, len = hanyuArr.length; i < len; i++) {
                if(Character.toString(hanyuArr[i]).matches("[\\u4E00-\\u9FA5]+")){
                    String[] pys = PinyinHelper.toHanyuPinyinStringArray(hanyuArr[i],format);
                    firstPinyin.append(pys[0].charAt(0));
                }else {
                    //firstPinyin.append(hanyuArr[i]);//特殊字符处理
                }
            }
        } catch (BadHanyuPinyinOutputFormatCombination badHanyuPinyinOutputFormatCombination) {
            badHanyuPinyinOutputFormatCombination.printStackTrace();
        }
        return firstPinyin.toString().toLowerCase();
    }

    private String getAllPinyin(String hanzi) {
        //输出格式设置
        HanyuPinyinOutputFormat format = new HanyuPinyinOutputFormat();
        /**
         * 输出大小写设置
         *
         * LOWERCASE:输出小写
         * UPPERCASE:输出大写
         */
        format.setCaseType(HanyuPinyinCaseType.LOWERCASE);

        /**
         * 输出音标设置
         *
         * WITH_TONE_MARK:直接用音标符（必须设置WITH_U_UNICODE，否则会抛出异常）
         * WITH_TONE_NUMBER：1-4数字表示音标
         * WITHOUT_TONE：没有音标
         */
        format.setToneType(HanyuPinyinToneType.WITHOUT_TONE);

        /**
         * 特殊音标ü设置
         *
         * WITH_V：用v表示ü
         * WITH_U_AND_COLON：用"u:"表示ü
         * WITH_U_UNICODE：直接用ü
         */
        format.setVCharType(HanyuPinyinVCharType.WITH_U_UNICODE);

        char[] hanYuArr = hanzi.trim().toCharArray();
        StringBuilder pinYin = new StringBuilder();

        try {
            for (int i = 0, len = hanYuArr.length; i < len; i++) {
                //匹配是否是汉字
                if (Character.toString(hanYuArr[i]).matches("[\\u4E00-\\u9FA5]+")) {
                    //如果是多音字，返回多个拼音，这里只取第一个
                    String[] pys = PinyinHelper.toHanyuPinyinStringArray(hanYuArr[i], format);
                    pinYin.append(pys[0]).append("");//是否添加隔断
                } else {
                    //pinYin.append(hanYuArr[i]).append("");//特殊字符处理
                }
            }
        } catch (BadHanyuPinyinOutputFormatCombination badHanyuPinyinOutputFormatCombination) {
            badHanyuPinyinOutputFormatCombination.printStackTrace();
        }
        return pinYin.toString();
    }


}
