{
  let b := 1
  for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
    let inv := add(b, 42)
    let x := extcodesize(mul(inv, 3))
    a := add(x, 1)
    mstore(a, inv)
  }
  for { let a := 1 } iszero(eq(a, 10)) { a := add(a, 1) } {
    let inv := add(b, 42)
    let x := sload(mul(inv, 3))
    a := add(x, 1)
    mstore(a, inv)
  }
}
// ----
// step: loopInvariantCodeMotion
//
// {
//     let b := 1
//     let a := 1
//     let inv := add(b, 42)
//     let x := extcodesize(mul(inv, 3))
//     for { } iszero(eq(a, 10)) { a := add(a, 1) }
//     {
//         a := add(x, 1)
//         mstore(a, inv)
//     }
//     let a_1 := 1
//     let inv_2 := add(b, 42)
//     let x_3 := sload(mul(inv_2, 3))
//     for { } iszero(eq(a_1, 10)) { a_1 := add(a_1, 1) }
//     {
//         a_1 := add(x_3, 1)
//         mstore(a_1, inv_2)
//     }
// }