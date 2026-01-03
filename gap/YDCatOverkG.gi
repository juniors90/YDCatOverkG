
#
# YDCatOverkG: Compute simples object for the Yetter-Drinfeld Categories over Group Algebras.
#
# Implementations
#

SimplesModYD := function( G, weight)
    local obj, M_g_rho, base;
    M_g_rho := InducedSubgroupRepresentation( G, weight.rho );;
    base := TensorBasisForSimpleMod( G, weight.g, weight.rho );;
    obj := Objectify( SimplesModYDType, rec( ) );
	SetSimple( obj, M_g_rho);
    SetWeight( obj, weight );
    SetBase( obj, base );
    SetGeneratorsOfG( obj, GeneratorsOfGroup(G) );
    SetGeneratorsOfImages( obj, GeneratorsOfGroup( Image( M_g_rho ) ) );
    SetGroupAttachedToMod( obj, G );
    SetStructureDescriptionOfG( obj, StructureDescription(G) );
    SetG_g(obj, Source(weight.rho));
    return obj;
end;

#############################################################################
# Operation On  Simple Mod YD ( Multiplicative Element )                                      #
#############################################################################

InstallMethod(\*,
    "multiply two SimplesModYD object",
    [IsSimplesModYDObj, IsSimplesModYDObj],
    function( simple1, simple2 )
    local gens, mgens, gen1, gen2, newrho, rep;

    if not( IsSimplesModYDObj( simple1 ) ) then
        Error("first argument must be a SimplesModYDObj.");
    fi;
    if not( IsSimplesModYDObj( simple2 ) ) then
        Error("second argument must be a SimplesModYDObj.");
    fi;

    gens  := simple1!.GeneratorsOfG;
    gen1  := simple1!.GeneratorsOfImages;
    gen2  := simple2!.GeneratorsOfImages;
    mgens := List( [1..Length( gens )],
                    i -> TensorProductOfMat( gen1[i], gen2[i] ) );
    newrho := GroupHomomorphismByImagesNC( 
                    simple1!.GroupAttachedToMod, Group( mgens )
                );
    rep := rec(
            group             := simple1!.GroupAttachedToMod,
            generatorsofgroup := gens,        # new feature
            rho               := newrho,      # new feature
            genimages         := mgens,
            isRepresentation  := true,
            dimension         := Length(mgens[1]),
    );
    return rep;
end);

###########################################################
# Print methods installation
###########################################################

InstallMethod(ViewString, "show D(G)-Module", [IsSimplesModYDObj],
    function(s)
        return Concatenation(
            "<Simple D(G)-Module with Weight ( ", ViewString(Weight(s).g), " , rho )>"
        );
end);

InstallMethod(String, "show D(G)-Module to string", [IsSimplesModYDObj],
    function(s)
        return Concatenation(
            "Weight = \n g = ", ViewString( Weight( s ).g ),
                   ", \n rho = ", String( Weight( s ).rho ), "\n",
            "M(g, rho) = ", String( Simple( s ) ), "\n",
            "Base = ", ViewString( Base( s ) ), "\n",
            "G = ", ViewString( GroupAttachedToMod(s)), "\n",
            "Structure Description of G = ", StructureDescription(GroupAttachedToMod(s)), "\n",
            "G_g = ", ViewString( G_g(s) ), "\n",
            "Structure Description of G_g = ", StructureDescription(G_g(s)), "\n"
        );
end);

InstallMethod(
    Display,
    "for D(G)-Module object",
    [ IsSimplesModYDObj],
    function( s )
        Print( "Weight = \n" );
        Print("g = ", ViewString( Weight( s ).g ), ",\n");
        Print("rho = ", String( Weight( s ).rho ),"\n");
        Print("M(g, rho) = ", String( Simple( s ) ), "\n");
        Print("Base = ", ViewString( Base( s ) ), "\n");
        Print("G = ", ViewString( GroupAttachedToMod(s) ), "\n");
        Print("Structure Description of G = ", StructureDescription(GroupAttachedToMod(s)), "\n");
        Print("G_g = ", ViewString( G_g(s) ), "\n");
        Print("Structure Description of G_g = ", StructureDescription(G_g(s)), "\n");
  end );

