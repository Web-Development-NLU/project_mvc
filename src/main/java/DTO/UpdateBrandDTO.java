package DTO;

import Model.Brand;
import java.time.LocalDate;

public class UpdateBrandDTO implements BaseDTO{
        private String name;
        protected LocalDate updatedAt;

        public UpdateBrandDTO(String name) {
            this.name = name;

        }
        public UpdateBrandDTO(Brand model) {
            this.name = model.getName();
            this.updatedAt = LocalDate.now();
        }


        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public LocalDate getUpdatedAt() {
            return updatedAt;
        }

        public void setUpdatedAt(LocalDate updatedAt) {
            this.updatedAt = updatedAt;
        }


    }
