!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
module MLP

private
integer,parameter :: Nq=32
public :: get_k_mlp_1,get_k_mlp_2,get_k_mlp_3
save


CONTAINS
subroutine get_k_mlp_1(Mix_Info,Tref,k)
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! subroutine to calculate the k-values for a given state
! by data interpolation using NEW DEVELOPED look-up table
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
use commonData, only : GasMixInfo
use MLP_network
USE MLP_structure_1
use MLP_layer
implicit none
  TYPE(GasMixInfo),INTENT(IN) :: Mix_Info ! Local mixture information  
  real(8),intent(in) :: Tref ! reference temperature
  real(8),dimension(Nq),intent(out) :: k ! k-values
  real(8) ::input_data_1(7),output_data_1(32)
  INTEGER :: i,j,n
  INTEGER :: number 
  real(8) ,DIMENSION(:),ALLOCATABLE ::b(:)
!-------------------------------------------------
  type(network_type) :: net
  net%layers_size =hidden_layer_sizes
  net%number_of_layer=number_of_layer
!-------------------------------------------------
  input_data_1(1)=Mix_Info%P
  input_data_1(2)=Tref
  input_data_1(3)=Mix_Info%T
  input_data_1(4)=Mix_Info%xCO2
  input_data_1(5)=Mix_Info%xH2O
  input_data_1(6)=Mix_Info%xCO
  input_data_1(7)=log10(Mix_Info%fv)
  if (input_data_1(7)<=-10) then       
    input_data_1(7)=-10
  end if
!--------------------
  DO i=1,7
      input_data_1(i)=(input_data_1(i)-u(i))/s(i)
  END DO
!--------------------
  net%layers(1)%W=coefs_0
  net%layers(1)%b=intercepts_0
  net%layers(2)%W=coefs_1
  net%layers(2)%b=intercepts_1
  net%layers(3)%W=coefs_2
  net%layers(3)%b=intercepts_2
  net%layers(4)%W=coefs_3
  net%layers(4)%b=intercepts_3
  net%layers(5)%W=coefs_4
  net%layers(5)%b=intercepts_4
  net%layers(6)%W=coefs_5
  net%layers(6)%b=intercepts_5
  net%layers(7)%W=coefs_6
  net%layers(7)%b=intercepts_6
!--------------------input layers----------------
  net%layers(1)%a=input_data_1
!-------------------hidden layers----------------
  do n=2,net%number_of_layer+2
       net%layers(n)%z = matmul(transpose(net%layers(n-1)%W),net%layers(n-1)%a)+ net%layers(n-1)%b
       if (n /=  net%number_of_layer+2)   then
              number=net%layers_size(n)              
              ALLOCATE(b(number))
              call sub1(net%layers(n)%z,b)
              net%layers(n)%a=b
              DEALLOCATE(b)
       end if
  end do
!-------------------ouput layer-----------------
  DO i=1,32
    k(i)=10**(net%layers(net%number_of_layer+2)%z(i)*sy(i)+uy(i))
  END DO
!-----------------------------------------------
RETURN
END SUBROUTINE get_k_mlp_1
!-------------------------------------------------------------------------
!-------------------------------------------------------------------------
subroutine get_k_mlp_2(Mix_Info,Tref,k)
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!  {'alphas': 0.008348454089902044, 'node': 418, 'number_hidden_layer': 5}}     11.4 MB    The training score:0.999081
!   subroutine to calculate the k-values for a given state
! by data interpolation using NEW DEVELOPED look-up table
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
use commonData, only : GasMixInfo
use MLP_network
USE MLP_structure_2
use MLP_layer

implicit none
  
  TYPE(GasMixInfo),INTENT(IN) :: Mix_Info ! Local mixture information  
  real(8),intent(in) :: Tref ! reference temperature
  real(8),dimension(Nq),intent(out) :: k ! k-values
  real(8) ::input_data_1(7),output_data_1(32)
  INTEGER :: i,j,n
  INTEGER :: number 
  real(8) ,DIMENSION(:),ALLOCATABLE ::b(:)
!-------------------------------------------------
  type(network_type) :: net
  net%layers_size =hidden_layer_sizes
  net%number_of_layer=number_of_layer
!-------------------------------------------------
  input_data_1(1)=Mix_Info%P
  input_data_1(2)=Tref
  input_data_1(3)=Mix_Info%T
  input_data_1(4)=Mix_Info%xCO2
  input_data_1(5)=Mix_Info%xH2O
  input_data_1(6)=Mix_Info%xCO
  input_data_1(7)=log10(Mix_Info%fv)
  if (input_data_1(7)<=-10) then       
    input_data_1(7)=-10
  end if

!--------------------
  DO i=1,7
      input_data_1(i)=(input_data_1(i)-u(i))/s(i)
  END DO

!--------------------
  net%layers(1)%W=coefs_0
  net%layers(1)%b=intercepts_0
  net%layers(2)%W=coefs_1
  net%layers(2)%b=intercepts_1
  net%layers(3)%W=coefs_2
  net%layers(3)%b=intercepts_2
  net%layers(4)%W=coefs_3
  net%layers(4)%b=intercepts_3
  net%layers(5)%W=coefs_4
  net%layers(5)%b=intercepts_4
  net%layers(6)%W=coefs_5
  net%layers(6)%b=intercepts_5


!--------------------input layers----------------
  net%layers(1)%a=input_data_1
!-------------------hidden layers----------------
  do n=2,net%number_of_layer+2
       net%layers(n)%z = matmul(transpose(net%layers(n-1)%W),net%layers(n-1)%a)+ net%layers(n-1)%b
       if (n /=  net%number_of_layer+2)   then
              number=net%layers_size(n)              
              ALLOCATE(b(number))
              call sub1(net%layers(n)%z,b)
              net%layers(n)%a=b
              DEALLOCATE(b)
       end if
  end do
!-------------------ouput layer-----------------
  DO i=1,32
    k(i)=10**(net%layers(net%number_of_layer+2)%z(i)*sy(i)+uy(i))
  END DO
!-----------------------------------------------
RETURN
END SUBROUTINE get_k_mlp_2
!-------------------------------------------------------------------------
!-------------------------------------------------------------------------

subroutine get_k_mlp_3(Mix_Info,Tref,k)
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!{'alphas': 0.0021935927282950725, 'node': 599, 'number_hidden_layer': 5}}      23.4MB      The training score:0.999124
! subroutine to calculate the k-values for a given state
! by data interpolation using NEW DEVELOPED look-up table
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
use commonData, only : GasMixInfo
use MLP_network
USE MLP_structure_3
use MLP_layer

implicit none
  
  TYPE(GasMixInfo),INTENT(IN) :: Mix_Info ! Local mixture information  
  real(8),intent(in) :: Tref ! reference temperature
  real(8),dimension(Nq),intent(out) :: k ! k-values
  real(8) ::input_data_1(7),output_data_1(32)
  INTEGER :: i,j,n
  INTEGER :: number 
  real(8) ,DIMENSION(:),ALLOCATABLE ::b(:)
!-------------------------------------------------
  type(network_type) :: net
  net%layers_size =hidden_layer_sizes
  net%number_of_layer=number_of_layer
!-------------------------------------------------
  input_data_1(1)=Mix_Info%P
  input_data_1(2)=Tref
  input_data_1(3)=Mix_Info%T
  input_data_1(4)=Mix_Info%xCO2
  input_data_1(5)=Mix_Info%xH2O
  input_data_1(6)=Mix_Info%xCO
  input_data_1(7)=log10(Mix_Info%fv)
  if (input_data_1(7)<=-10) then       
    input_data_1(7)=-10
  end if

!--------------------
  DO i=1,7
      input_data_1(i)=(input_data_1(i)-u(i))/s(i)
  END DO

!--------------------
  net%layers(1)%W=coefs_0
  net%layers(1)%b=intercepts_0
  net%layers(2)%W=coefs_1
  net%layers(2)%b=intercepts_1
  net%layers(3)%W=coefs_2
  net%layers(3)%b=intercepts_2
  net%layers(4)%W=coefs_3
  net%layers(4)%b=intercepts_3
  net%layers(5)%W=coefs_4
  net%layers(5)%b=intercepts_4
  net%layers(6)%W=coefs_5
  net%layers(6)%b=intercepts_5
  net%layers(7)%W=coefs_6
  net%layers(7)%b=intercepts_6


!--------------------input layers----------------
  net%layers(1)%a=input_data_1
!-------------------hidden layers----------------
  do n=2,net%number_of_layer+2
       net%layers(n)%z = matmul(transpose(net%layers(n-1)%W),net%layers(n-1)%a)+ net%layers(n-1)%b
       if (n /=  net%number_of_layer+2)   then
              number=net%layers_size(n)              
              ALLOCATE(b(number))
              call sub1(net%layers(n)%z,b)
              net%layers(n)%a=b
              DEALLOCATE(b)
       end if
  end do
!-------------------ouput layer-----------------
  DO i=1,32
    k(i)=10**(net%layers(net%number_of_layer+2)%z(i)*sy(i)+uy(i))
  END DO
!-----------------------------------------------
RETURN
END SUBROUTINE get_k_mlp_3
!-------------------------------------------------------------------------
!-------------------------------------------------------------------------

subroutine sub1(x,res)  
IMPLICIT NONE
    real(8), intent(in) :: x(:)
    real(8) ::O=0.0, res(size(x))
    res = max(O, x)
return 
end subroutine
!--------------------
end module MLP