package com.example.association2.repository;

import com.example.association2.model.AssociationMemberDTO;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.DeleteMapping;

import java.util.List;

@Mapper
public interface AssociationMemberRepository {

    //用userId查询associationId
    @Select("select associationid from associationmember where userid=#{userId}")
    public int findassociationIdByUserId(@Param("userId")int userId);
    //用userId查询member
    @Select("select * from associationmember a,(select name,associationid from association) b where a.associationid=b.associationid and userid=#{userId}")
    public List<AssociationMemberDTO> findMemberByUserId(@Param("userId")int userId);
    @Select("select * from associationmember a,(select name,associationid from association) b where a.associationid=b.associationid and id=#{id}")
    public AssociationMemberDTO findMemberById(@Param("id")int id);
    //查询会长简介
    @Select("select description from associationmember where position =1 and associationid =#{associationId}")
    public String findPresidentDesByAssid(@Param("associationId")int associationId);
    //查询副会长简介
    @Select("select description from associationmember where position =2 and associationid =#{associationId}")
    public List<String> findVicePresidentDesByAssid(@Param("associationId")int associationId);
   //查询部长简介
   @Select("select description from associationmember where position =3 and associationid =#{associationId}")
   public List<String> findMinisterDesByAssid(@Param("associationId")int associationId);
   //查询所有
   @Select("select * from associationmember a,(select name,associationid from association) b where a.associationid=b.associationid")
   public List<AssociationMemberDTO> findAllMember();
   //删除成员根据id
   @Delete("delete from associationmember where id=#{id}")
   public void deleteUser(@Param("id")int id);
   //更新成员信息
    @Update("update associationmember set description =#{description},position=#{position} where userid =#{userId}")
    public void updateAm(@Param("userId")int userId,@Param("position")String position,@Param("description")String description);

    //更新协会时会长更新
    @Update("update associationmember set position =1,userid=#{userId} where associationId =#{associationId}")
    public void updatePresidentByAssociationId(@Param("userId")int userId,@Param("associationId")int associationId);
}
