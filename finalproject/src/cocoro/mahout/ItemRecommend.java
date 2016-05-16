
package cocoro.mahout;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

public class ItemRecommend {

   public static List<Integer> re_Id = new ArrayList<Integer>();

   public List<Integer> recommend(int s_id) throws IOException 
   {

      try {
         DataModel dm = new FileDataModel(new File("C:/Users/OHYEONJU/CocoPro/Cocoro/data/recommend.csv"));
         ItemSimilarity sim = new LogLikelihoodSimilarity(dm);

         // TanimotoCoefficientSimilarity sim = new
         // TanimotoCoefficientSimilarity(dm);
         GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(dm, sim);
         int x = 1;

         for (LongPrimitiveIterator items = dm.getItemIDs(); items.hasNext();) {
            
            long itemId = items.nextLong();
            List<RecommendedItem> recommendations = recommender.mostSimilarItems(itemId, 4);
            for (RecommendedItem recommendation : recommendations) {

               System.out.println(itemId + "," + recommendation.getItemID() + "," + recommendation.getValue());

                 if(s_id==itemId){ 
                 re_Id.add((int)
                 recommendation.getItemID()); }
                
            }
            /*
             * x++; if (x > 10) System.exit(1);
             */
         }
         System.out.println(re_Id.size());
         /* System.out.println(s_id); */

      } catch (TasteException e) {
         System.out.println("there was an Taste Exception.");
         e.printStackTrace();
      }

      return re_Id;
   }
   
/*   public static void main(String args[]) throws IOException{
      ItemRecommend it = new ItemRecommend();
      List<Integer> list1 = it.reommend(1);
      for(int i = 0 ; i <list1.size();i++)
      {
         list1.get(i);
      }
   }*/

}
// }