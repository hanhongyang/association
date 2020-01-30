package com.example.association2.repository;

import com.example.association2.model.Association;
import com.example.association2.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AssociationRepository {
    @Results(id="AssociationMap", value={
            @Result(property = "associationId", column = "associationid"),
            @Result(property = "createTime", column = "createtime"),
            @Result(property = "type", column = "type"),
            @Result(property = "description", column = "description"),
            @Result(property = "ownerId", column = "ownerid"),
            @Result(property = "name", column = "name"),
            @Result(property = "logo", column = "logo"),
            @Result(property = "signatureActivity", column = "signatureactivity")
    })

    @Select("select * from association where associationstatus=1")
    public List<Association> findAllAssociations();

    @Select("select ownerid from association where associationId=#{associationId}")
    public int findOwnerIdByAssociationId(int associationId);
    @Select("select * from association where ownerid=#{userId}")
    public Association findAssByUserId(int userId);
    @Select("select title from activity ac,(select signatureActivity from  association  where associationId=#{associationId})a where ac.activityId=a.signatureActivity   ")
    public  String  findSignatureActivityName(int associationId);

    @Select("select * from association where associationstatus=0")
    public List<Association> findAllAssociationsApply();
    @Select("select * from association ")
    public List<Association> findAllAss();
    @Select("select * from association where type =#{type} and associationstatus=1")
    public List<Association> findAssociationsByType(@Param("type")int type);
    @Select("select * from association where associationid =#{associationId} ")
    public Association findAssociationById(@Param("associationId")int associationId);
    @Select("select name from association where associationid=#{associationid}")
    public List<String> findAssociationNameByAssociationId(@Param("associationId")int associationId);
    @Insert("insert into association(" +
            "description," +
            "name," +
            "createtime," +
            "type," +
            "ownerid," +
            "logo," +
            "signatureactivity) " + "values(" +
            "#{description}," +
            "#{name}," +
            "null," +
            "#{type}," +
            "#{ownerId}," +
            "#{logo},null)")
    public  void addAssociation(@Param("description")String  description,
                                @Param("name")String name,
                                @Param("createTime")String createTime,
                                @Param("type")int type,
                                @Param("ownerId")int ownerId,
                                @Param("logo")String logo);
    @Insert("insert into association(" +
            "description," +
            "name," +
            "createtime," +
            "type," +
            "ownerid," +
            "logo," +
            "associationstatus) " + "values(" +
            "#{description}," +
            "#{name}," +
            "#{createTime}," +
            "#{type}," +
            "#{ownerId}," +
            "#{logo}," +
            "1)")
    public  void addAss(@Param("description")String  description,
                                @Param("name")String name,
                                @Param("createTime")String createTime,
                                @Param("type")int type,
                                @Param("ownerId")int ownerId,
                                @Param("logo")String logo);

    @Delete("delete from association where associationId=#{associationId}")
    public void deleteAss(@Param("associationId")int associationId);
    @Update("update association set associationstatus =1,createtime=#{createTime} where associationId =#{associationId}")
    public void applyPass(@Param("createTime") String createTime,@Param("associationId")int associationId);
    @Update("update association set associationstatus =2 where associationId =#{associationId}")
    public void applyRefuse(@Param("associationId")int associationId);
    @Update("update association set description =#{description}," +
            "name=#{name}," +
            "type=#{type}," +
            "ownerId=#{ownerId}," +
            "logo=#{logo} ," +
            "signatureactivity=#{signatureActivity} " +
            "where associationid =#{associationId}")
    public void assModify(@Param("description")String  description,
                          @Param("name")String name,
                          @Param("type")int type,
                          @Param("ownerId")int ownerId,
                          @Param("logo")String logo,
                          @Param("signatureActivity")Integer signatureActivity,
                          @Param("associationId")int associationId);
}
