package com.example.association2.service;


import com.example.association2.model.Association;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AssociationService {
    public List<Association> findAllAssociations();
    public List<Association> findAssociationsByType(@Param("type")int type);
    public Association findAssociationById(@Param("associationId")int associationId);
    public List<String> findAssociationNameByAssociationId(@Param("associationId")int associationId);
    public  void addAssociation(@Param("description")String  description,
                                @Param("name")String name,
                                @Param("createTime")String createTime,
                                @Param("type")int type,
                                @Param("ownerId")int ownerId,
                                @Param("logo")String logo);
    public List<Association> findAllAss();
    public  void addAss(@Param("description")String  description,
                        @Param("name")String name,
                        @Param("createTime")String createTime,
                        @Param("type")int type,
                        @Param("ownerId")int ownerId,
                        @Param("logo")String logo);
    public void deleteAss(@Param("associationId")int associationId);
    public List<Association> findAllAssociationsApply();
    public void applyPass(@Param("createTime") String createTime,@Param("associationId")int associationId);
    public void applyRefuse(@Param("associationId")int associationId);
    public void assModify(@Param("description")String  description,
                          @Param("name")String name,
                          @Param("type")int type,
                          @Param("ownerId")int ownerId,
                          @Param("logo")String logo,
                          @Param("signatureActivity")Integer signatureActivity,
                          @Param("associationId")int associationId);
    public  String  findSignatureActivityName(int associationId);
    public Association findAssByUserId(int userId);
    public int findOwnerIdByAssociationId(int associationId);
}
