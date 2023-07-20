class SignUpWithEmailAndPasswordFailure{
  final String message;
 const SignUpWithEmailAndPasswordFailure([this.message= "An Unknown error Occurred"]);

   factory SignUpWithEmailAndPasswordFailure.code(String code){
     switch(code){
       case 'weak-password' :
         return SignUpWithEmailAndPasswordFailure('Please Enter Strong Password');

         case 'invalid-email' :
         return SignUpWithEmailAndPasswordFailure('Email is not valid');

         case 'email-already-in-use' :
         return SignUpWithEmailAndPasswordFailure('An account already exists for that email');

         case 'operation-already-in-use' :
         return SignUpWithEmailAndPasswordFailure('Operation not allowed contact support');

         case 'user-disabled' :
         return SignUpWithEmailAndPasswordFailure('This user has been disabled. Please contact support');

         default : return SignUpWithEmailAndPasswordFailure();
     }
   }
}