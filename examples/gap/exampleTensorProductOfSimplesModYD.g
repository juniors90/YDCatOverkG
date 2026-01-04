#! @Chapter Object of Yetter–Drinfeld categories over group algebras.
#!
#! @Section Tensor Product Of Simple
#!
#! @BeginChunk Example_TensorProductOfSimplesModYD
#! @BeginExampleSession
#! gap> LoadPackage("YDCatOverkG", "0", false);
#! true
#! gap> G:=SymmetricGroup(3);
#! Sym( [ 1 .. 3 ] )
#! gap> repCC:=List(ConjugacyClasses(G), Representative);
#! [ (), (1,2), (1,2,3) ]
#! gap> simples_attached_to_e := SimplesModAttachedToElement( G, repCC[1] );
#! [ <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )>, 
#!   <Simple D(G)-Module with Weight ( () , rho )> ]
#! gap> rho:=simples_attached_to_e[3];
#! <Simple D(G)-Module with Weight ( () , rho )>
#! gap> TensorProductOfSimplesModYD(rho, rho);
#! rec( dimension := 4, generatorsofgroup := [ (1,2,3), (1,2) ], 
#!   genimages := 
#!     [ 
#!       [ [ E(3), 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, E(3)^2 ] 
#!          ], 
#!       [ [ 0, 0, 0, E(3)^2 ], [ 0, 0, 1, 0 ], [ 0, 1, 0, 0 ], 
#!           [ E(3), 0, 0, 0 ] ] ], group := S3, isRepresentation := true, 
#!   rho := [ (1,2,3), (1,2) ] -> 
#!     [ 
#!       [ [ E(3), 0, 0, 0 ], [ 0, 1, 0, 0 ], [ 0, 0, 1, 0 ], [ 0, 0, 0, E(3)^2 ] 
#!          ], 
#!       [ [ 0, 0, 0, E(3)^2 ], [ 0, 0, 1, 0 ], [ 0, 1, 0, 0 ], 
#!           [ E(3), 0, 0, 0 ] ] ] )
#! @EndExampleSession
#! @EndChunk