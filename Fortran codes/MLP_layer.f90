module MLP_layer
  implicit none
  private
  public :: layer_type
  type :: layer_type
    real(8), allocatable :: W(:,:) ! weights
    real(8), allocatable :: b(:)     ! biases
    real(8), allocatable :: z(:)      ! arg. to activation function
    real(8), allocatable :: a(:)     ! activations
  end type layer_type
end module MLP_layer