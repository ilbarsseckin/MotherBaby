package com.ilbarsseckinapp.mother;

import android.os.Environment;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;

public class FileTask {
	private static String directoryPath=Environment.getExternalStorageDirectory()+"/Mother";
	private static String filepath=directoryPath+"/";
	public static String getFilepath(String filename)
	{
		return filepath+filename;
	}
	public static boolean existsFile(String filename)
	{
		return new File(filepath+filename).exists();
	}
	public static boolean existsDirectory()
	{
		return new File(directoryPath).exists();
	}
	public static void createFolder()
	{
		if(!existsDirectory())new File(directoryPath).mkdir();

	}
   public static void writeData(String filename,String data)
   {
	   try
	   {
           createFolder();
		   FileOutputStream writer=new FileOutputStream(new File(filepath+filename));
		   writer.write(data.getBytes());
		   writer.close();


	   }
	   catch(Exception e){}
   }

   public static String readData(String filename)
   {
	   try{
           File file=new File(filepath+filename);
           if(!file.exists())return "";
           FileInputStream read=new FileInputStream(file);
           InputStreamReader ireader=new InputStreamReader(read);
           BufferedReader reader=new BufferedReader(ireader);
           String data;
           data=reader.readLine();
           reader.close();

           return data;
	   }
	   catch(RuntimeException e){
	   	return "";}
	   catch(Exception e){return "";}
   }
	public static void deleteFile (String filename)
	{
			File file=new File(filepath+filename);
			//if(!file.exists())return "";
			file.delete();
			/*
			FileInputStream read=new FileInputStream(file);
			InputStreamReader ireader=new InputStreamReader(read);
			BufferedReader reader=new BufferedReader(ireader);
			String data;
			data=reader.readLine();
			reader.close();
			return data;
			*/

		//catch(RuntimeException e){Errors.addRuntimeException("ReadFile ->"+filename+":",e.getMessage(),e.getLocalizedMessage());return "";}
	//	catch(Exception e){Errors.addException("ReadFile ->"+filename+":",e.getMessage(),e.getLocalizedMessage());return "";}
	}


}
