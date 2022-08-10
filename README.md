# MIDI_Dynamic_Network
These tools analyze MIDI tracks, convert their pitch and rhythmic data into temporal dynamic networks in the form of .csv files, and then plot that data.

Example output:
![Alt text](http://kylequarles.com/wp-content/uploads/2022/08/example_output_movie_snapshot.png)

![alttext](http://kylequarles.com/wp-content/uploads/2022/08/example_output_filmstrip.png)

A piece of music's pitch relationships are profitably modeled as a directed graph, and such a graph can be considered a snapshot of the implicit syntactical rules for that music.
For example, if we have some music with a starting note A, then the next note played is B, then finally C, this simple musical passage would be modeled 
by a digraph with 3 nodes (A,B, and C), and two directed edges, like this: A-->B-->C.

But musical syntax changes throughout a piece. What is needed is a way to track which syntactical rules apply at any given time point, or alternatively, which were active
for a given section of time.

Temporal network theory affords such an analysis, and this repo includes customizable tools to visualize and analyze temporal network data derived from music.

Directions:
1) Place a MIDI file of your choice (with .mid file extension) in your working directory
2) Open the Python script and change variable `mid` to the file path for your MIDI file.
3) Run the python script; this will create four .csv files for each track in your MIDI file and save them to your working directory.
4) Open the R script in R studio
5) Load the .csv files into the corresponding variables of the same names
6) Run the R script to see your data output as a static graph, filmstrip, and movie.

Many parameters can be altered in the R script to customize output. One of the most relevant for musicians is the frame slicing parameters, accessed in the `slice.par` variable
in the R script. These control at which points the data is snapshot; often musicians are interested in segmenting syntactical areas based on musical phrase boundaries. The
automatic detection of musical phrases is a hard problem, and right now the user must supply these segmentation points himself.

It's my hope that these tools will enable composers, theorists, and musicologists to generate new insights into musical syntax. A whole slew of 
new and powerful analytical concepts from temporal network theory can now be deployed to study a musical corpus (centrality, forward reachability, etc.), with simple additions
to the core R script provided.
