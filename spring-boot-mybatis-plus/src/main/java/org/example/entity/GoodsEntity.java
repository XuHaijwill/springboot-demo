package org.example.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.example.base.BaseBizEntity;

import java.math.BigDecimal;

@Getter
@Setter
@Accessors(chain = true)
@TableName("t_goods")
public class GoodsEntity extends BaseBizEntity {

    private String name;

    private BigDecimal price;

    @Override
    public String toString() {
        return "GoodsEntity{" +
                "name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
