package org.example.model;

import java.math.BigDecimal;
import java.util.Date;

public class Test {
    private BigDecimal tId;

    private Long tBigint;

    private Long tUnsignedBigint;

    private BigDecimal tDecimal;

    private BigDecimal tMoney;

    private BigDecimal tSmallmoney;

    private String tChar;

    private String tUnichar;

    private String tUnivarchar;

    private Date tSmalldatetime;

    private String tText;

    private String tUnitext;

    private byte[] tImage;

    private byte[] tBinary;

    private byte[] tVarbinary;

    public BigDecimal gettId() {
        return tId;
    }

    public void settId(BigDecimal tId) {
        this.tId = tId;
    }

    public Long gettBigint() {
        return tBigint;
    }

    public void settBigint(Long tBigint) {
        this.tBigint = tBigint;
    }

    public Long gettUnsignedBigint() {
        return tUnsignedBigint;
    }

    public void settUnsignedBigint(Long tUnsignedBigint) {
        this.tUnsignedBigint = tUnsignedBigint;
    }

    public BigDecimal gettDecimal() {
        return tDecimal;
    }

    public void settDecimal(BigDecimal tDecimal) {
        this.tDecimal = tDecimal;
    }

    public BigDecimal gettMoney() {
        return tMoney;
    }

    public void settMoney(BigDecimal tMoney) {
        this.tMoney = tMoney;
    }

    public BigDecimal gettSmallmoney() {
        return tSmallmoney;
    }

    public void settSmallmoney(BigDecimal tSmallmoney) {
        this.tSmallmoney = tSmallmoney;
    }

    public String gettChar() {
        return tChar;
    }

    public void settChar(String tChar) {
        this.tChar = tChar == null ? null : tChar.trim();
    }

    public String gettUnichar() {
        return tUnichar;
    }

    public void settUnichar(String tUnichar) {
        this.tUnichar = tUnichar == null ? null : tUnichar.trim();
    }

    public String gettUnivarchar() {
        return tUnivarchar;
    }

    public void settUnivarchar(String tUnivarchar) {
        this.tUnivarchar = tUnivarchar == null ? null : tUnivarchar.trim();
    }

    public Date gettSmalldatetime() {
        return tSmalldatetime;
    }

    public void settSmalldatetime(Date tSmalldatetime) {
        this.tSmalldatetime = tSmalldatetime;
    }

    public String gettText() {
        return tText;
    }

    public void settText(String tText) {
        this.tText = tText == null ? null : tText.trim();
    }

    public String gettUnitext() {
        return tUnitext;
    }

    public void settUnitext(String tUnitext) {
        this.tUnitext = tUnitext == null ? null : tUnitext.trim();
    }

    public byte[] gettImage() {
        return tImage;
    }

    public void settImage(byte[] tImage) {
        this.tImage = tImage;
    }

    public byte[] gettBinary() {
        return tBinary;
    }

    public void settBinary(byte[] tBinary) {
        this.tBinary = tBinary;
    }

    public byte[] gettVarbinary() {
        return tVarbinary;
    }

    public void settVarbinary(byte[] tVarbinary) {
        this.tVarbinary = tVarbinary;
    }
}