/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobases2;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.io.IntWritable;

//import Model.Text;
import java.io.IOException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 *
 * http://mvnrepository.com/artifact/org.apache.hadoop/hadoop-common/2.9.0
 */
public class ProyectoBases2 {

    
    public static class Map extends Mapper<LongWritable, Text, Text, IntWritable>{

        public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException{

            try{
                
                String line = value.toString();
                JSONParser parser = new JSONParser();
                
                JSONArray sites = (JSONArray) parser.parse(line);
                
                
                for (Object o : sites){
                    String otemp = (String) o;
                    String object = otemp.replaceAll(",$", "");
                    try {
                        JSONObject site = (JSONObject) parser.parse(object);
                        String title = (String) site.get("Title");
                        String url = (String) site.get("URL");
                        JSONArray textarray = (JSONArray) site.get("Content");
                        for (Object t : textarray) {
                            JSONObject textobject = (JSONObject) t;
                            String tag = (String) textobject.get("Tag");
                            String text = (String) textobject.get("Text");
                            String[] words = text.split(" ");
                            for(int i = 0; i < words.length; i ++) {
                                String word = words[i];
                                //data.add(new Model.Text(tag, word, url, title));
                                context.write(new Text(word), new IntWritable(1));
                            }
                            
                        }
                    }
                    catch(Exception e) {
                        
                    }
                }
            }catch(ParseException ex){

            }
        }
    }

    public static class Reduce extends Reducer<Text,Text,Text, IntWritable>{

        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException{

            int sum = 0;
            for(IntWritable value : values)
            {
            sum += value.get();
            }
            context.write(key, new IntWritable(sum));
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        /*if (args.length != 2) {
            System.err.println("Usage: ProyectoBases2 <in> <out>");
            System.exit(2);
        }*/

        Job job = new Job(conf, "ProyectoBases2");
        job.setJarByClass(ProyectoBases2.class);
        job.setMapperClass(Map.class);
        job.setReducerClass(Reduce.class);
        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        job.setInputFormatClass(TextInputFormat.class);
        job.setOutputFormatClass(TextOutputFormat.class);

        FileInputFormat.addInputPath(job, new Path(args[1]));
        FileOutputFormat.setOutputPath(job, new Path(args[0]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
