package com.example.association2.service;

import com.example.association2.model.Association;
import com.example.association2.repository.AssociationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssociationServiceImpl implements AssociationService {
    @Autowired
    private AssociationRepository associationRepository;
    @Override
    public List<Association> findAllAssociations() {
        return associationRepository.findAllAssociations();
    }

    @Override
    public List<Association> findAssociationsByType(int type) {
        return associationRepository.findAssociationsByType(type);
    }

    @Override
    public Association findAssociationById(int associationId) {
        return associationRepository.findAssociationById(associationId);
    }

    @Override
    public List<String> findAssociationNameByAssociationId(int associationId) {
        return associationRepository.findAssociationNameByAssociationId(associationId);
    }

    @Override
    public void addAssociation(String description, String name, String createTime, int type, int ownerId,String logo) {
        associationRepository.addAssociation(description,name,createTime,type,ownerId,logo);
    }

    @Override
    public List<Association> findAllAss() {
        return associationRepository.findAllAss();
    }

    @Override
    public void addAss(String description, String name, String createTime, int type, int ownerId, String logo) {
        associationRepository.addAss(description,name,createTime,type,ownerId,logo);
    }

    @Override
    public void deleteAss(int associationId) {
        associationRepository.deleteAss(associationId);
    }

    @Override
    public List<Association> findAllAssociationsApply() {
        return associationRepository.findAllAssociationsApply();
    }

    @Override
    public void applyPass(String createTime,int associationId) {
        associationRepository.applyPass(createTime,associationId);
    }

    @Override
    public void applyRefuse(int associationId) {
        associationRepository.applyRefuse(associationId);
    }

    @Override
    public void assModify(String description, String name, int type, int ownerId, String logo,Integer signatureActivity,int associationId) {
        associationRepository.assModify(description,name,type,ownerId,logo,signatureActivity,associationId);
    }

    @Override
    public String findSignatureActivityName(int associationId) {
        return associationRepository.findSignatureActivityName(associationId);
    }

    @Override
    public Association findAssByUserId(int userId) {
        return associationRepository.findAssByUserId(userId);
    }

    @Override
    public int findOwnerIdByAssociationId(int associationId) {
        return associationRepository.findOwnerIdByAssociationId(associationId);
    }
}
