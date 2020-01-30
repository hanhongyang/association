package com.example.association2.service;


import com.example.association2.model.Association;
import com.example.association2.model.AssociationMemberDTO;
import com.example.association2.repository.AssociationMemberRepository;
import com.example.association2.repository.AssociationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssociationMemberServiceImpl implements AssociationMemberService{
    @Autowired
    private AssociationMemberRepository associationMemberRepository ;

    @Override
    public int findassociationIdByUserId(int userId) {
        return associationMemberRepository.findassociationIdByUserId(userId);
    }

    @Override
    public String findPresidentDesByAssid(int associationId) {
        return associationMemberRepository.findPresidentDesByAssid(associationId);
    }

    @Override
    public List<String> findVicePresidentDesByAssid(int associationId) {
        return associationMemberRepository.findVicePresidentDesByAssid(associationId);
    }

    @Override
    public List<String> findMinisterDesByAssid(int associationId) {
        return associationMemberRepository.findMinisterDesByAssid(associationId);
    }

    @Override
    public List<AssociationMemberDTO> findAllMember() {
        return associationMemberRepository.findAllMember();
    }

    @Override
    public void deleteUser(int Id) {
        associationMemberRepository.deleteUser(Id);
    }

    @Override
    public List<AssociationMemberDTO> findMemberByUserId(int userId) {
        return associationMemberRepository.findMemberByUserId(userId);
    }

    @Override
    public void updateAm(int userId, String position, String description) {
        associationMemberRepository.updateAm(userId,position,description);
    }

    @Override
    public void updatePresidentByAssociationId(int userId, int associationId) {
        associationMemberRepository.updatePresidentByAssociationId(userId,associationId);
    }

    @Override
    public AssociationMemberDTO findMemberById(int id) {
        return associationMemberRepository.findMemberById(id);
    }
}
