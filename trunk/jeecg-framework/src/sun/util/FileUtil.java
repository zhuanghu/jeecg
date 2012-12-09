package sun.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

/**
 * 文件工具类
 * 
 * 
 * @author zhou junfeng <br>
 * 
 */
public class FileUtil {

	/**
	 * 生成随机的文件名 将原始文件名去掉,改为一个UUID的文件名,后缀名以原文件名的后缀为准
	 * 
	 * @param fileName
	 *            原始文件名+后缀
	 * @return
	 */
	public static String generateUUIDFileName(String fileName) {

		UUID uuid = UUID.randomUUID();
		String str = fileName;
		System.out.println(str);
		str = uuid.toString() + "." + str.substring(str.lastIndexOf(".") + 1);
		return str;
	}

	/**
	 * 获得一个文件全路径中的文件名
	 * 
	 * @param filePath
	 *            文件路径
	 * @return 文件名
	 */
	public static String getFileName(String filePath) {

		filePath = filePath.replace("\\", "/");
		if (filePath.indexOf("/") != -1) {
			return filePath.substring(filePath.lastIndexOf("/") + 1);
		}
		return filePath;
	}

	/**
	 * 拷贝文件
	 * 
	 * @param src
	 *            源文件
	 * @param dst
	 *            目标文件
	 */
	public static void copyFile(File src, File dst) {
		try {
			FileInputStream in = null;
			FileOutputStream out = null;
			try {
				out = new FileOutputStream(dst);
				in = new FileInputStream(src);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
			} catch (Exception e) {
				e.printStackTrace();
				String dstpath = dst.getAbsolutePath();
				if (dstpath.lastIndexOf("/") != -1) {
					dstpath = dstpath.subSequence(0, dstpath.lastIndexOf("/"))
							.toString();
				} else {
					dstpath = dstpath.subSequence(0, dstpath.lastIndexOf("\\"))
							.toString();
				}
				createDirectory(dstpath);
				copyFile(src, dst);
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 目录不存在的话创建目录
	 * 
	 * @param Directorypath
	 */
	public static void createDirectory(String Directorypath) {
		File file = new File(Directorypath);
		if (!file.exists()) {
			file.mkdir();
			file.mkdirs();
		}
	}

	/**
	 * 目录不存在的话创建目录
	 * 
	 * @param Directorypath
	 */
	public static String checkSaveDir(String dir) {

		File dirFile = new File(dir);
		boolean flag = true;
		if (!dirFile.exists()) {
			flag = dirFile.mkdirs();
		}
		if (flag)
			return dirFile.getAbsolutePath();
		else
			return null;
	}

	/**
	 * 删除文件
	 * 
	 * @param files
	 */
	public static void deleteFile(File... files) {
		if (files == null) {
			return;
		}
		for (File f : files) {
			if (f.exists()) {
				f.delete();
			}
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param files
	 */
	public static void deleteDirectory(File file) {
		if (file.exists()) { // 判断文件是否存在
			if (file.isFile()) { // 判断是否是文件
				file.delete(); // delete()方法 你应该知道 是删除的意思;
			} else if (file.isDirectory()) { // 否则如果它是一个目录
				File[] files = file.listFiles(); // 声明目录下所有的文件 files[];
				for (int i = 0; i < files.length; i++) { // 遍历目录下所有的文件
					deleteDirectory(files[i]); // 把每个文件 用这个方法进行迭代
				}
			}
			file.delete();
		} else {
			System.out.println("所删除的文件不存在！" + '\n');
		}
	}

	// 文件名转码
	public static String encodeDownloadFileName(String fileName, String agent)
			throws IOException {
		String codedfilename = null;
		if (agent != null) {
			agent = agent.toLowerCase();
		}
		if (null != agent && -1 != agent.indexOf("msie")) {
			String prefix = fileName.lastIndexOf(".") != -1 ? fileName
					.substring(0, fileName.lastIndexOf(".")) : fileName;
			String extension = fileName.lastIndexOf(".") != -1 ? fileName
					.substring(fileName.lastIndexOf(".")) : "";
			String name = prefix;
			int limit = 150 - extension.length();
			if (name.getBytes().length != name.length()) {// zn
				if (getEncodingByteLen(name) >= limit) {
					name = subStr(name, limit);
				}
			} else {// en
				limit = prefix.length() > limit ? limit : prefix.length();
				name = name.substring(0, limit);
			}
			name = URLEncoder.encode(name + extension, "UTF-8").replace('+',
					' ');
			codedfilename = name;
		} else if (null != agent && -1 != agent.indexOf("firefox")) {
			codedfilename = "=?UTF-8?B?"
					+ (new String(Base64.encodeBase64(fileName
							.getBytes("UTF-8")))) + "?=";
		} else if (null != agent && -1 != agent.indexOf("safari")) {
			codedfilename = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
		} else if (null != agent && -1 != agent.indexOf("applewebkit")) {
			codedfilename = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
		} else {
			codedfilename = URLEncoder.encode(fileName, "UTF-8").replace('+',
					' ');
		}
		return codedfilename;
	}

	private static int getEncodingByteLen(String sub) {
		int zhLen = (sub.getBytes().length - sub.length()) * 2;
		int enLen = sub.length() * 2 - sub.getBytes().length;
		return zhLen + enLen;
	}

	// 限制名字的长度
	private static String subStr(String str, int limit) {
		String result = str.substring(0, 17);
		int subLen = 17;
		for (int i = 0; i < limit; i++) {
			if (limit < getEncodingByteLen(str.substring(0, (subLen + i) > str
					.length() ? str.length() : (subLen)))) {
				result = str.substring(0, subLen + i - 1);
				break;
			}
			if ((subLen + i) > str.length()) {
				result = str.substring(0, str.length() - 1);
				break;
			}
		}
		return result;
	}

}
