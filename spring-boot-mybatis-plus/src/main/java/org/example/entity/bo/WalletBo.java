package org.example.entity.bo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class WalletBo {

    private BigDecimal alipay;

    private BigDecimal wechat;

}
