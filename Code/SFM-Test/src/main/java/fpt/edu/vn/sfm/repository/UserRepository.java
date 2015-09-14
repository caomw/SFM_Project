package fpt.edu.vn.sfm.repository;

import fpt.edu.vn.sfm.model.SystemUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Khắc Vỹ on 9/14/2015.
 */
@Repository
public interface UserRepository extends CrudRepository<SystemUser, Integer>{
    SystemUser findByUsername(String username);
}
