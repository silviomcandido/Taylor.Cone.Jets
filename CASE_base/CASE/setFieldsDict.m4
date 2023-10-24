/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.0.0                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    format      ascii;
    class       dictionary;
    object      blockMeshDict;
}

include(./CASE/CASE.m4)

defaultFieldValues
(
    volScalarFieldValue alpha.water 0
);

regions
(
  cylinderToCell
  {
      p1 (0 -calc(0) 0); //Min
      p2 (0 calc(L*1e-3) 0); //Max
      radius calc(Din*1e-3/2);

     fieldValues
      (
           volScalarFieldValue alpha.water 1
		   volVectorFieldValue U (0 -13e-3 0)
       );
  }
	sphereToCell
	{
		centre          (0 0 0);
		radius          calc((Din)*1e-3/2);
		fieldValues
		(
           volScalarFieldValue alpha.water 1
		);
	}
 );

