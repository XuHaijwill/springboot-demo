package org.example.base;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter
@Setter
@Accessors(chain = true)
public class BaseBizEntity extends BaseEntity {

    private static final long serialVersionUID = 1464845551976822009L;

    /**
     * 启用状态
     * @see
     */
    private Boolean enabledState;

    /**
     * 删除状态
     * @see
     */
    @TableLogic
    private Boolean deletedState;

}
