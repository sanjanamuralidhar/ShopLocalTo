abstract class UpdateEvent{}
class OnUpdate extends UpdateEvent{
 final String username;
 final String email;
 final String address;
 final String website;
 final String phone;
 final String info;

  OnUpdate(this.username, this.email, this.address, this.website, this.phone, this.info);
}
class AfterUpdate extends UpdateEvent{
  
}