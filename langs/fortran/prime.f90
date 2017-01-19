program prime
  implicit none
  integer :: count, length, n
  character(:), allocatable :: arg

  count = command_argument_count()
  n = 10000000
  if (count >= 1) then
     call get_command_argument(1, length = length)
     allocate (character(length) :: arg)
     call get_command_argument(1, arg)
     read (arg, *, err=100) n
     if ( n < 0 ) goto 100
     deallocate (arg)
  end if
  print '(i0)', count_prime(n)
  stop

100 stop 1

contains
  function sieve(size)
    integer, intent(in) :: size
    logical :: sieve(size)
    integer :: root, i

    sieve = .true.
    if (size == 0) then
       return
    end if
    sieve(1) = .false.
    root = int(sqrt(dble(size)) + 1)
    do i = 1, root
       if (sieve(i)) then
          sieve(i * i : size : i) = .false.
       end if
    end do
  end function sieve

  function count_prime(n)
    integer, intent(in) :: n
    integer :: count_prime, i
    logical :: sieve_array(n)

    count_prime = 0
    sieve_array = sieve(n)
    do i = 1, n
       if (sieve_array(i)) then
          count_prime = count_prime + 1
       end if
    end do
  end function count_prime
end program prime
