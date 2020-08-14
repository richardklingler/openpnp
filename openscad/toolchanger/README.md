## Tool Changer for CP40 nozzles

![CP40 tool Changer](Tool_Changer.png)

This is a simple design for CP40 nozzle holder.
The number and the distance betwwen nozzles is configurable in OpenSCAD.

This design uses 4 parts for this:

- Tool_Changer_Mount.scad: Bottom part for mounting all 4 parts to the table. Height has to be adjusted to your needs.
- Tool_Changer_Bottom,scad: A thin layer of 1mm where the nozzles slide in, the thickness is adjusted with the 's' parameter
- Tool_Changer_Middle.scad: This part uses a clamp mechanism so that nozzles stay in place. The force of the clamp can be adjusted with the 'o' parameter'
- Tool_Changer_Top.scad: Top layer which will be screwed down to the table with all other parts

