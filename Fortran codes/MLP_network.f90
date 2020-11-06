module MLP_network
use MLP_layer
  implicit none
  private
  public :: network_type
  type :: network_type
    integer , allocatable :: layers_size(:)
    integer , allocatable :: number_of_layer
    type(layer_type):: layers(1:20)    !number_of_layer is less than 20
  end type network_type
end module MLP_network



