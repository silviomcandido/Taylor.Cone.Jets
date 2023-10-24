import os
import pyvista as pv
import matplotlib.pyplot as plt
import numpy as np
#from matplotlib import colors as mcolors
#pv.set_plot_theme("ParaView")
#pv.set_plot_theme("document")
pv.set_plot_theme("dark")
cmap=plt.cm.get_cmap('bwr')
#cmap=plt.cm.get_cmap('binary')
# Time
#time = 9
times = os.listdir('./postProcessing/samples/')
T= np.array(times,dtype=float)
iT = np.argmax(T)
time = times[iT]
# File name
def find(name, path):
    for root, dirs, files in os.walk(path):
        if name in files:
            return os.path.join(root, name)

isoSurface_file     = './postProcessing/samples/' + str(time) + '/iso1.vtp'
cutPlane1_file      = './postProcessing/samples/' + str(time) + '/face.vtp'
cutPlane2_file      = './postProcessing/samples/' + str(time) + '/cutPlane2.vtp'
# Create the rendering scene
#p = pv.Plotter(off_screen=True, window_size=[4000, 4000])
p = pv.Plotter()
# What to plot
addNozzle   = 0
addIso      = 0
addNormal   = 0
addFloor    = 0
showMesh    = 0
show_planar_grid = 1
sargs = dict(height=0.35, vertical=True, position_x=0.85, position_y=0.05, label_font_size=36, title_font_size=40)
# Add nozzle
if addNozzle==1:
    wallN = pv.read(wallInlet_file)
    p.add_mesh(wallN, 'grey',  show_edges=showMesh, lighting=True)
# Create isoSurface
if addIso==1:
    isoSurface = pv.read(isoSurface_file)
    contour = 'Ue'
    c = isoSurface.get_array(contour)
    p.add_mesh(isoSurface, show_edges=showMesh,
               lighting=True, cmap=cmap, opacity=1.0, scalars=c)
    edges = isoSurface.extract_all_edges()
    p.add_mesh(edges, line_width=1, color='white')
    #p.add_scalar_bar(contour)

if show_planar_grid==True:
    cutPlane = pv.read(cutPlane1_file)
    edges = cutPlane.extract_all_edges()
    p.add_mesh(edges, line_width=1, color='white')

#---------------------------------------------------------------------------
# Create normalPlane
#---------------------------------------------------------------------------
##normalPlane = pv.read(cutPlane1_file)
##normalPlane['Ue']=normalPlane['Ue']/1000
##contour = 'Ue'
##normalPlane.set_active_scalars(contour)
##normalPlane.rename_array('Ue', 'Ue [kV]')
##cc = normalPlane.contour()
##p.add_mesh(cc, line_width=5, cmap=cmap, scalar_bar_args=sargs, name='plane1')
        
# Create normalPlane
if addNormal==1:
    show_edges = showMesh
    isoLines   = 0
    opacity    = 0.5
    contour    = 'alpha.water'
    # cutPlane 1
    cutPlane = pv.read(cutPlane1_file)
    c = cutPlane.get_array(contour)
    p.add_mesh(cutPlane, scalars=c , show_edges=0, lighting=False, opacity=opacity, cmap=cmap)
    #edges = cutPlane.extract_all_edges()
    #p.add_mesh(edges, line_width=1, color='white')


    # isoLines Plot
    if isoLines == 1:
        
        c1 = c.min() + 0.999*c.max()
        c2 = c.max() - 0.001*c.max()
        VOF1 = cutPlane.contour([c1])
        VOF2 = cutPlane.contour([c2])
        p.add_mesh(VOF1, color='blue', line_width=2)
        p.add_mesh(VOF2, color='red', line_width=2)

        
# Add floor face
if addFloor==1:
    floor = pv.read(floor_file)
    p.add_mesh(floor, 'grey', show_edges=showMesh, lighting=False)
# Add grid
#p.show_grid()
# Add orientation axes
#p.show_axes()
# Add text
p.add_text('Time: %.1f ms\n'%(float(time)*1000), font_size=20)
# Select the view plane
#p.view_xy()
p.view_xy()
#p.view_isometric()
#p.view_vector((1,-1,1))
# Show the scene
#p.show(screenshot='3D-Jet.png')
p.show()

