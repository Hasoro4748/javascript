class Account{
  constructor(bank, id, name, balance){
    this.bank = bank;
    this.id = id;
    this.name = name;
    this.balalnce = balance;
  }
  deposit(money){
    this.balalnce += money;
  }
  withdraw(money){
    this.balalnce -= money;
  }
  show(){
    document.write('<p>');
    document.write('은행 : ' + this.bank + '<br>');
    document.write('계좌번호 : ' + this.id + '<br>');
    document.write('입금주 : ' + this.name + '<br>');
    document.write('현재잔액 : ' + this.balalnce + '<br>');
    document.write('</p>');
  }
}