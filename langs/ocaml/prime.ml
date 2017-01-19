let sieve size : bool array =
  if size <= 1 then
    Array.make size false
  else
    let sieveArray = Array.make size true in
    let root = int_of_float (sqrt (float size)) in
    sieveArray.(0) <- false;
    sieveArray.(1) <- false;
    for i = 2 to root do
      if sieveArray.(i) then
        let rec inner j =
          if j < size then (
            sieveArray.(j) <- false;
            inner (j + i))
        in
        inner (i * i)
    done;
    sieveArray;;

let countPrime n : int =
  Array.fold_left (fun sum x -> sum + if x then 1 else 0) 0 (sieve (n + 1));;

let n : int =
  if Array.length Sys.argv >= 2 then
    int_of_string Sys.argv.(1)
  else
    10000000;;

let () =
  Printf.printf "%d\n" (countPrime n);;
