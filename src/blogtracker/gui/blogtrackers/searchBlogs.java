/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package blogtracker.gui.blogtrackers;

import blogtracker.util.UtilFunctions;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.lucene.analysis.StopAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;

/**
 *
 * @author skumar34
 */
public class searchBlogs extends UtilFunctions
{
    public searchBlogs()
    {
        
    }

     public String SEARCH_INDEX; //= "C:\\Program Files (x86)\\blazeds\\tomcat\\webapps\\blazeds\\BlogTracker\\blogtrackers-index";


//     public void loadGlobalConstants()
//    {
//
//        BufferedReader br = null;
//        try {
//            //System.out.println(System.getProperty("user.dir"));
//            HashMap<String,String> hm = new HashMap<String,String>();
//            br = new BufferedReader(new FileReader("..\\webapps\\ROOT\\WEB-INF\\classes\\authentication\\blogtrackers.config"));
//            String temp = "";
//            while((temp = br.readLine())!=null)
//            {
//                temp = temp.trim();
//                //System.out.println(temp);
//                if(temp.isEmpty()||temp.startsWith("//"))
//                {
//                    continue;
//                }
//                else
//                {
//                    String[] arr = temp.split("##");
//                    //System.out.println(arr[0]+" "+arr[1]);
//                    if(arr.length==2)
//                    {
//                        hm.put(arr[0].trim(), arr[1].trim());
//                    }
//                }
//            }
//            if(!hm.isEmpty())
//            {
//                SEARCH_INDEX = hm.get("searchIndex");
//
//            }
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }finally {
//            try {
//                br.close();
//            } catch (IOException ex) {
//               ex.printStackTrace();
//            }
//
//        }
//
//    }
//    public void loadGlobalConstants()
//    {
//        try {
//            JFigLocatorIF locator = new blogtracker.util.LocalJFigLocator("config/", "config.xml");
//            JFigIF confInstance = org.igfay.jfig.JFig.getInstance(locator);
//            SEARCH_INDEX = confInstance.getValue("Indices", "searchIndex");
//
//        } catch (JFigException ex) {
//            System.out.println("Configuration file Not found");
//        }
//    }

    public List<SearchResults> getSearchResults(String query)
    {
        try {
            loadConstants();
            SEARCH_INDEX = hm.get("searchIndex");
            //blogtracker.util.indexSearch ind = new blogtracker.util.indexSearch();
            blogtracker.util.stopWordsList.fillStopWordsList();
            //String SEARCH_INDEX = "C:\\Program Files (x86)\\blazeds\\tomcat\\webapps\\blazeds\\BlogTracker\\blogtrackers-index";
            //String SEARCH_INDEX = "blogtrackers-index";
            StopAnalyzer analyzer = new StopAnalyzer(blogtracker.util.stopWordsList.stopwords);
            Searcher newSearch = new IndexSearcher(SEARCH_INDEX);
            QueryParser searchParser;
            searchParser = new QueryParser("content", analyzer);
            Query searchQuery = searchParser.parse(query);
            Hits searchHits = newSearch.search(searchQuery);
//            System.out.println("Search query" + searchQuery);
//            System.out.println("Search Hits" + searchHits);
            List<SearchResults> sresults = new ArrayList<SearchResults>();
            for(int i=0;i<searchHits.length();i++)
            {
                Document tempDoc = searchHits.doc(i);
                SearchResults temp = new SearchResults(Integer.parseInt(tempDoc.get("id").toString()), tempDoc.get("title"), tempDoc.get("blogger"), tempDoc.get("date"));
                sresults.add(temp);
            }
            return sresults;
        } catch (ParseException ex) {
            Logger.getLogger(searchBlogs.class.getName()).log(Level.SEVERE, null, ex);
        } catch (CorruptIndexException ex) {
            Logger.getLogger(searchBlogs.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(searchBlogs.class.getName()).log(Level.SEVERE, null, ex);
        }
           return null;
        }

    public String getPosts(int postID)
    {
        //System.out.println(postID);
        String post =  getBlogPost(postID);
        return post;
    }

   
    }

