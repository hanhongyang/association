package com.example.association2.service;

import com.example.association2.model.AssociationMemberDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AssociationMemberService {

    public int findassociationIdByUserId(@Param("userId")int userId);
    public String findPresidentDesByAssid(@Param("associationId")int associationId);
    public List<String> findVicePresidentDesByAssid(@Param("associationId")int associationId);
    public List<String> findMinisterDesByAssid(@Param("associationId")int associationId);
    public List<AssociationMemberDTO> findAllMember();
    public void deleteUser(@Param("id")int id);
    public List<AssociationMemberDTO> findMemberByUserId(@Param("userId")int userId);
    public void updateAm(@Param("userId")int userId,@Param("position")String position,@Param("description")String description);
    public void updatePresidentByAssociationId(@Param("userId")int userId,@Param("associationId")int associationId);
    public AssociationMemberDTO findMemberById(@Param("id")int id);
}
