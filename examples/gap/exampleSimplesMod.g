#! @Chapter Basis for Yetter-Drinfeld module
#!
#! @Section Finding a Simples Modules attached to Element
#!
#! @BeginChunk Example_SimplesMod
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> G := SymmetricGroup(3);
#! Sym( [ 1 .. 3 ] )
#! gap> all_simples := SimplesMod( G );
#! [ <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2,3) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2,3) , rho )>, 
#!   <Simple D(G)-Module with Weight ( (1,2,3) , rho )> ]
#! gap> dim_drinfelf_double_of_G := Order(G)^2; # dim(D(H))
#! 36
#! gap> sum_squares_of_M_g_rho := Sum(List(all_simples, x -> Length(Base(x))^2));
#! 36
#! gap> dim_drinfelf_double_of_G = sum_squares_of_M_g_rho;
#! true
#! @EndExampleSession
#! @EndChunk
