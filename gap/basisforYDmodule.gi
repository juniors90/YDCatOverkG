
InstallGlobalFunction( TensorBasisForSimpleMod, function( G, g, rho )
    local rec_rho, Vbase, cosets, Gbase, TensorBase, idxs, Gamma_g;

    # Computamos la representación usando Serre
    rec_rho := REPN_ComputeUsingSerre(rho);

    # Base de la representación irreducible
    Vbase := rec_rho.basis;

    # Lista de cosets derechos de Gamma_g en G
    Gamma_g := Centralizer(G, g);
    cosets := RightCosets(G, Gamma_g);

    # Tomamos un representante de cada coset
    Gbase := List( cosets, c -> Representative( c ) );
    
    # Armamos la base del tensor kG ⊗ V como pares formales
    TensorBase := List(Cartesian(Gbase, Vbase), x -> GModElement( x[1], x[2] ));

    return TensorBase;
end);


InstallGlobalFunction( GetCentralizers, function( G )
    local c, conjClasses, rep, size, ratio, centralizer, centralizers;
    
    centralizers := [];
    
    conjClasses:= ConjugacyClasses( G );
    
    for c in conjClasses do
        rep := Representative(c);
        size := Size(c);
        centralizer := Centralizer(G, rep);
        # Verificación de la fórmula |clase| = |G| / |centralizador|
        ratio := Size(G) / Size(centralizer);
        if ratio = size then
            Add(centralizers, rec(centralizer:=centralizer, rep:=rep));;
        else
            Print("¡Error en la verificación!\n");
        fi;
    od;
    return centralizers;
end);


InstallGlobalFunction(GetCentralizerOfElement, function(G, g )
    local centralizer, sizeG, sizeC, classSize, idx, repElementSDP;

    if not (g in List(ConjugacyClasses(G), Representative)) then
        Error("⚠️ The element g is not a representative of the conjugation class of G.\n");
    fi;
    
    # Calcula el centralizador de g en G
    centralizer := Centralizer(G, g);
    
    # (opcional) verificamos la fórmula |clase| = |G| / |centralizador|
    sizeG := Size(G);
    sizeC := Size(centralizer);
    classSize := sizeG / sizeC;

    
    # Devolvemos un registro con la info
    return rec(
        rep := g,
        centralizer := centralizer,
        classSize := classSize,
        centralizerSize := sizeC,
        structure := StructureDescription( centralizer ),
    );
end);


InstallGlobalFunction( SimplesMod, function( G )
    local c, irrepsGamma_g, simples, rho, chi, weight, centralizers;

    simples:= [];;
    centralizers := GetCentralizers( G );

    for c in centralizers do
        irrepsGamma_g := Irr( c.centralizer );
        for chi in irrepsGamma_g do
            rho := IrreducibleAffordingRepresentation( chi );;
            weight:= rec(g:= c.rep, rho:= rho);
            Add( simples, SimplesModYD( G, weight) );
        od;
    od;
    return simples;
end);


InstallGlobalFunction( SimplesModAttachedToElement, function(G, g )
    local base, c, i, irrepsGamma_g, simples, rho, chi, M_g_rho, weight;

    simples:= [];;

    irrepsGamma_g := Irr(  Centralizer(G, g) );
    for chi in irrepsGamma_g do
        rho := IrreducibleAffordingRepresentation( chi );;
        weight := rec( g := g, rho := rho );
        Add( simples, SimplesModYD( G, weight) );
    od;
    return simples;
end );
