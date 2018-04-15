package exception;

/**
 * 自定义异常类，用来将预期异常信息返回到程序中
 */
public class CustomException extends Exception{
    // 异常信息(有可能是预期异常或者运行时异常）
    // 需要在CustomExceptionResolver异常处理器判断
    public String message;

    public CustomException(String message){
        super(message);
        this.message=message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
