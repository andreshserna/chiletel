package com.chiletel.usermanagementservice.model;

import java.io.Serializable;
import javax.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class TechnicianSpecialtyId implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long technicianId;
    private Long damageId;

}
