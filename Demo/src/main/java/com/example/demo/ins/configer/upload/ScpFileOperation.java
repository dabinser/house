package com.example.demo.ins.configer.upload;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.SCPClient;
import ch.ethz.ssh2.SFTPv3Client;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * 通过SCP方式操作linux上文件
 */
@Slf4j
@Data
@Component
public class ScpFileOperation {
    @Value("${scp.hostname}")
    private String hostname;

    @Value("${scp.port}")
    private int port;

    @Value("${scp.username}")
    private String username;

    @Value("${scp.password}")
    private String password;

    @Value("${scp.targetPath}")
    private String targetPath;

    public Connection getConnection() {
        Connection connection = new Connection(hostname, port);
        if (connection == null) {
            connection = new Connection(hostname, port);
            return connection;
        }
        return connection;
    }

    /**
     * ssh用户登录验证,使用用户名和密码验证
     */
    public Connection getConnctionAuthedWithPassword() throws IOException {
        Connection connection = this.getConnection();
        connection.connect();
        boolean login = connection.authenticateWithPassword(username, password);
        if (login) {
            return connection;
        } else {
            return null;
        }
    }

    /**
     * 获取文件
     */
    public void getFile (String fileName) throws IOException {
        Connection connection = this.getConnctionAuthedWithPassword();
        if (connection != null) {
            SCPClient client = connection.createSCPClient();
            String remotePath = targetPath.concat(fileName);
            client.get(remotePath);
            log.debug("File downLoad success!");
        } else {
            log.debug("Linux login failed!");
        }
    }

    /**
     * 上传文件
     */
    public void putFile(String localFile,Long length,String mode) throws IOException {
        Connection connection = this.getConnctionAuthedWithPassword();
        if (connection != null) {
            SCPClient client = connection.createSCPClient();
            client.put(localFile,length,targetPath,mode);
            log.debug("File upload success!");
        } else {
            log.debug("Linux login failed!");
        }
    }

    /**
     * 上传文件
     */
    public String putFile(String localFile,long length,String remoteFileName) throws IOException {
        Connection connection = this.getConnctionAuthedWithPassword();
        if (connection != null) {
            SCPClient client = connection.createSCPClient();
            client.put(localFile, length, targetPath, "0600");
            log.debug("File upload success!");
        } else {
            log.debug("Linux login failed!");
        }
        return targetPath + remoteFileName;
    }


    /**
     * 上传文件
     */
    public String putFile(byte[] localFile,long length, String remoteFileName) throws IOException {
        Connection connection = this.getConnctionAuthedWithPassword();
        if (connection != null) {
            SCPClient client = connection.createSCPClient();
            client.put(localFile.toString(),length,targetPath,"0600");
            log.debug("File upload success!");
        } else {
            log.debug("Linux login failed!");
        }
        return targetPath + remoteFileName;
    }

    /**
     * 删除文件
     */
    public void deleteFile (String url) throws IOException {
        Connection connection = this.getConnctionAuthedWithPassword();
        if (connection != null) {
            SFTPv3Client sftpClient = new SFTPv3Client(connection);
            sftpClient.rm(url);
            sftpClient.close();
        } else {
            log.debug("Linux login failed!");
        }
    }

//    public static void main(String[] args) {
//        getFile("/home/sehrsscfileadmin/file/English3.txt", "C:\\Users\\robjiang\\Desktop\\HRSSC");
//        putFile("C:\\Users\\robjiang\\Desktop\\HRSSC\\English3.txt", "abc.txt", "/home/sehrsscfileadmin/file");
//    }
}
