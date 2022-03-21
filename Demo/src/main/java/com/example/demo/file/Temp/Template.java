package com.example.demo.file.Temp;


import com.lowagie.text.pdf.BaseFont;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

/**
 * @Author jeff
 * @Date 16/02/2022 15:45
 * @Version 1.0
 * @Description:
 */
@Component
public class Template {
    /**
     * 根据模板生成PDF合同,dataMap代表生成pdf合同所需要的数据，以map的形式存入，map的key值一定要跟html模板中占位
     * 符的值一致，如果有空值的话，要将其赋为空字符串；
     * 模板中的占位符两边一定要用3个#包围起来；
     * contractMsg是一个list集合，其泛型为字符串数组，里面存放的是货物清单中的每一行数据，
     * templateRootUrl是表示生成合同所需要模板的路径; contractRootUrl是表示生成的合同所放位置的路径;
     * fileRuleUrl是代表生成合同所放路径目录的格式;
     * templateName表示模板的名字
     *
     */
    @Value("${file}")
    private String createdFilePath;
    @Value("${contractFile}")
    private String contractUrl;

    public void createPDFContract(Map<String,String> dataMap, ArrayList<String[]> contractMsg, String templateRootUrl,
                                  String templateName)
    {
        //创建相应的流资源
        OutputStream os = null;
        FileOutputStream fileoutputstream = null;
        FileInputStream fileinputstream = null;
        String templateContent = null;

        try {
//所需要的html模板的路径
            String filePath = templateRootUrl+templateName;
//新建读取模板文件的流资源
            fileinputstream = new FileInputStream(filePath);
//获得输入流的长度
            int lenght = fileinputstream.available();
//再建一个该长度的数组
            byte bytes[] = new byte[lenght];
//把输入流中的数据以字节的形式读入到数组中
            fileinputstream.read(bytes);
//关闭流资源
            fileinputstream.close();
//通过使用平台的默认字符集解码指定的 byte数组，构造一个新的 String，来存放html模板
            templateContent = new String(bytes);
//根据传入的数据生成货物清单的html页面元素
            String s = "";
            for (int i = 0; i < contractMsg.size(); i++) {
                    s = s + "<tr><td>" + contractMsg.get(i)[0] + "</td><td>"
                    + contractMsg.get(i)[1] + "</td><td>"
                    + contractMsg.get(i)[2] + "</td><td>"
                    + contractMsg.get(i)[3] + "</td><td align='right'>"
                    + contractMsg.get(i)[4] + "</td><td>"
                    + contractMsg.get(i)[5] + "</td><td align='right'>"
                    + contractMsg.get(i)[6] + "</td></tr>";
            }
//用具体的货物清单的html页面元素去替代模板中的占位符
            templateContent = templateContent.replaceAll(
                    "###ordersList###", s);
//用具体的值去代替模板中的占位符

            templateContent=templateContent.replaceAll("###lanlady###",dataMap.get("lanlady"));
            templateContent=templateContent.replaceAll("###tenant###",dataMap.get("tenant"));
            templateContent=templateContent.replaceAll("###address###",dataMap.get("address"));
            templateContent=templateContent.replaceAll("###rcode###",dataMap.get("rcode"));
            templateContent=templateContent.replaceAll("###beginData###",dataMap.get("beginData"));
//用当前日期并且以固定的格式生成文档存放的目录
//            String newImagePath = FileTypeUtil.getSerial(new Date(),filePath) + "/";
//            FileCreateNameUtils.toCreateName();
//使用平台的默认字符集将此 String编码为 byte序列，并将结果存储到一个新的 byte数组中
            byte html_bytes[] = templateContent.getBytes();
// 通过日历日期的格式来生成生成的word文档的名字，防止重复
            Calendar calendar = Calendar.getInstance();
            String fileName = String.valueOf(calendar.getTimeInMillis());
            String htmlFileName = fileName + ".html";
//创建生成文档html文档目录的File对象
            File htmlFile = new File(contractUrl);
//判断文件是否存在，不存在则新创建
            if (!htmlFile.exists()) {
                htmlFile.mkdirs();
            }
/*            // 通过日历日期的格式来生成生成的word文档的名字，防止重复
            Calendar calendar = Calendar.getInstance();
            fileName = String.valueOf(calendar.getTimeInMillis()) + ".doc";
// 用当前日期的年月日来最为存放word合同包的名称
            String newImagePath = FileTypeUtil.getSerial(new Date(),fileRuleUrl) + "/";
// 创建合同的文件对象
            File outFile = new File(contractRootUrl+ "/" + newImagePath + fileName);
// 如果文档对象的目录不存在的话，就按指定规则生成目录
            if (!outFile.getParentFile().exists()) {undefined
                outFile.getParentFile().mkdirs();
            }

————————————————
            版权声明：本文为CSDN博主「zhds」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/zhigengniaoblog/article/details/77477526*/
// 生成的html文件保存路径。
            htmlFileName = createdFilePath + "/" + htmlFileName;
// 建立文件输出流
            fileoutputstream = new FileOutputStream(htmlFileName);
//生成html文档到指定位置
            fileoutputstream.write(html_bytes);
//关闭流资源
            fileoutputstream.close();
//生成的pdf存放的位置
            String outputFile =createdFilePath + "/" + fileName + ".pdf";
//给pdf文档的输出流对象赋值
            os = new FileOutputStream(outputFile);
//将html对象转化成pdf文档
            ITextRenderer renderer = new ITextRenderer();
            String url = new File(htmlFileName).toURI().toURL().toString();
            renderer.setDocument(url);
            renderer.getFontResolver().addFont(templateRootUrl + "msyh.ttc",
                    BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            renderer.layout();
//生成pdf合同
            renderer.createPDF(os);
//关闭流资源
            os.flush();
            os.close();
            fileoutputstream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
//确保流资源彻底关闭
            try {
                if (os != null) {
                    os.close();
                }
                if (fileinputstream != null) {
                    fileinputstream.close();
                }
                if (fileoutputstream != null) {
                    fileoutputstream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
