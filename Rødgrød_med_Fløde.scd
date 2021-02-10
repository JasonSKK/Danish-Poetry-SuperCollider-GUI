//Apr. 2020
(
Window.closeAll;
w = Window("Rødgrød Med Fløde", resizable: true).front
.alwaysOnTop_(true);
w.bounds_(Rect(900, 500, 300, 200));
w.view.background_(Color.gray(0.07, 0.3));
//Window->Closes
w.onClose = {
    Pdef(\ds1).stop;
    Pdef(\ds2).stop;
    Pdef(\ds3).stop;
    Pdef(\ds4).stop;
    Pdef(\ds5).stop;
    Pdef(\ds6).stop;
    Pdef(\hh).stop;
    Pdef(\bd).stop;
    Pdef(\sn).stop;
    s.freeAll;
};

~title = StaticText (w , Rect (175, 475, 150, 25))
.string_("Rødgrød
Med Fløde")
.font_(Font("VictorianText", 25))
.align_(\center)
.background_(Color.gray)
.stringColor_(Color.rand);
~title.bounds_(Rect(75, 3, 150, 55)).background_(Color.clear).stringColor_(Color.red(0.7));
//COMPOSITE_VIEW
c = Array.fill(6, {
    arg view;
    view = CompositeView(w, 40@110)
    .background_(Color.grey(0.1));
    view.decorator_(FlowLayout(w.bounds, 10@10, 10@10))
});
c[0].bounds_(Rect(0, 60, 65, 140 ));
c[1].bounds_(Rect(230, 60, 70, 140 ));
c[2].bounds_(Rect(65, 130, 175, 70 )).background_(Color.red(0.6));
c[3].bounds_(Rect(65, 60, 175, 70)).background_(Color.new255(205, 192, 176, 255));
c[4].bounds_(Rect(65, 155, 175, 20)).background_(Color.white);
c[5].bounds_(Rect(105, 130, 20, 70)).background_(Color.white);
//ON_OFF_BUTTON
~button = Button(w, Rect(10, 5, 50,30))
.states_([
    ["OFF",Color.black, Color.gray(0.5, 0.666)],
    ["ON" , Color.white, Color.red(1, 0.5)]
])
.font_(Font("Times New Roman", 18))
.action_({
    |obj|
    if (
        obj.value == 1,
        {
            "ON".postln;
            Pdef(\ds1).stop;
            (
                Pdef(\ds1,
    Pbind(
        \instrument,
        \dSS1s,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[0].value ,inf),
        \freq, 1
        );
).play;
);
             Pdef(\ds2).stop;
            (
                Pdef(\ds2,
    Pbind(
        \instrument,
        \a15,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[1].value ,inf),
        \freq,  ~f1,
        );
).play;
);
            Pdef(\ds4).stop;
            (
                Pdef(\ds4,
    Pbind(
        \instrument,
        \nhs1,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]* 0.5*a[2].value ,inf),
        \freq, 1
        );
).play;
);
            //SLIDERS
            Pdef(\ds3).stop;
    Pdef(\ds3,
    Pbind(
        \instrument,
        \bipp,
        \dur, Prand([1,0.5],inf),
        \scale, Scale.ionian,
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*d[0].value ,inf),
        \octave, [6,5].choose,
        \degree, Prand([0, 2, 4, 5, 7, 9, 11, 12],inf),
)).play;
    Pdef(\ds5).stop;
    (
    Pdef(\ds5,
    Pbind(
        \instrument,
        \7777,
        \dur, Pseq([0.25],inf),
        \scale, Scale.ionian,
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]* 0.5 * d[1].value ,inf),
        \octave, [3,4].choose,
        \degree, Prand([0, 7, 5, 12, 11, 2, 3, 12, 7],inf),
)).play;
);
            Pdef(\ds6).stop;
            Pdef(\ds6,
    Pbind(
        \instrument,
        \Acc_of_AT,
        \dur, Prand([0.5],inf),
        \scale, Scale.ionian,
                    \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*0.1* d[2].value   ,inf),
        \octave, [5,6],
        \degree, Prand([0, 7, 5, 12, 11, 2, 3, 12, 7],inf),
)).play;
            //Percussion
            Pdef(\hh).stop;
            if (~hhO_F.value == 1 ,{
            Pdef(\hh, (
                    Pbind(
                    \instrument,
                    \bikeclick,
                    \dur, ~valhh,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
            });
            Pdef(\bd).stop;
            if(~bdO_F.value == 1, {
                Pdef(\bd, (
                    Pbind(
                        \instrument,
                        \fmS,
                        \dur, ~valbd,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
            });
            Pdef(\sn).stop;
            if(~snO_F.value == 1, {
                Pdef(\sn, (
                    Pbind(
                        \instrument,
                        \snfm,
                        \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
            })
    });
    if (obj.value == 0, {
        "OFF".postln;
        Pdef(\ds1).stop;
        Pdef(\ds2).stop;
        Pdef(\ds3).stop;
        Pdef(\ds4).stop;
        Pdef(\ds5).stop;
        Pdef(\ds6).stop;
        Pdef(\hh).stop;
        Pdef(\bd).stop;
        Pdef(\sn).stop;
        s.freeAll;
    });
});
//RodgrodMedFlode
~rod = Button(w, Rect(90, 0, 120,60))
.states_([
    ["s",Color.clear, Color.clear]
])
.font_(Font("Times New Roman", 18))
.action_({
    |obj|
    obj.value.postln;
    if (obj.value == 0, {Synth("rod")})
});
//Knobs
a = Array.fill(3, {Knob(c[0], Rect(0,100, 100, 50))});
a[0].bounds_(Rect(-30, 30, 100, 30));
a[1].bounds_(Rect(-30, 65, 100, 30));
a[2].bounds_(Rect(-30, 100, 100, 30));
//ds1_Knob1
a[0].action_({
    |obj|
    var amp1;
    amp1 = obj.value. postln;
    if (
        (Pdef(\ds1).isPlaying) && (~button.value == 1),
        {
                Pdef(\ds1,
    Pbind(
        \instrument,
        \dSS1s,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*amp1 ,inf),
        \freq, 1
            ));
        }
    )
});
//ds2_Knob2
a[1].action_({
    |obj|
    var amp2;
    amp2 = obj.value. postln;
    if (
        (Pdef(\ds2).isPlaying) && (~button.value == 1) ,
        {
                Pdef(\ds2,
    Pbind(
      \instrument,
        \a15,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*amp2 ,inf),
        \freq,  ~f1,
            ));
        }
    )
});
//ds3_Knob2
a[2].action_({
    |obj|
    var amp3;
    amp3 = obj.value. postln;
    if (
        (Pdef(\ds4).isPlaying) && (~button.value == 1),
        {
                Pdef(\ds4,
    Pbind(
      \instrument,
        \nhs1,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*amp3 ,inf),
        \freq,  ~f2,
            ));
        }
    )
});
//Button_Pitch1
~bpitch = Button(c[0], Rect(10, 5,50,30))
.states_([
    ["X1",Color.black, Color.white],
    ["X2" , Color.red(0.6), Color.white],
    ["X3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(40, 35, 20, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if (~button.value == 1,{
    if (
        obj.value == 0,
        {
            Pdef(\ds1).stop;
obj.value.postln;
    Pdef(\ds1,
    Pbind(
        \instrument,
        \dSS1s,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[0].value ,inf),
        \freq,  1,
            )).play;
    });
    //X2
    if (obj.value == 1,{
        obj.value.postln;
        Pdef(\ds1).stop;
    Pdef(\ds1,
    Pbind(
        \instrument,
        \dSS1s,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[0].value ,inf),
        \freq,  2,
            )).play
});
    //X3
    if (obj.value == 2,{
        obj.value.postln;
        Pdef(\ds1).stop;
    Pdef(\ds1,
    Pbind(
        \instrument,
        \dSS1s,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[0].value ,inf),
        \freq, 3,
            )).play
});
    });
});
//Button_Pitch2
~f1 = 440;
~bpitch2 = Button(c[0], Rect(10,5,50,30))
.states_([
    ["X1",Color.black, Color.white],
    ["X2" , Color.red(0.6), Color.white],
    ["X3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(40, 70, 20, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if ( ~button.value == 1, {
    if (
        obj.value == 0,
        {
            obj.value.postln;
            ~f1 = 440;
            Pdef(\ds2).stop;
    Pdef(\ds2,
    Pbind(
        \instrument,
        \a15,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[1].value ,inf),
        \freq,  ~f1,
            )).play;
    });
    //X2
    if (obj.value == 1,{
        obj.value.postln;
        ~f1 = 880;
        Pdef(\ds2).stop;
    Pdef(\ds2,
    Pbind(
        \instrument,
        \a15,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[1].value ,inf),
        \freq,  ~f1,
            )).play
});
    //X3
    if (obj.value == 2,{
        obj.value.postln;
        ~f1 = 1320;
        Pdef(\ds2).stop;
    Pdef(\ds2,
    Pbind(
        \instrument,
        \a15,
        \dur, Pwhite(1,2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[1].value ,inf),
        \freq, ~f1,
            )).play
});
    });
});
//Button_Pitch3
~f2 = 1;
~bpitch3 = Button(c[0], Rect(10,5,50,30))
.states_([
    ["X1",Color.black, Color.white],
    ["X2" , Color.red(0.6), Color.white],
    ["X3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(40, 105, 20, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if (~button.value == 1, {
    if (
        obj.value == 0,
        {
            ~f2 = 1;
            obj.value.postln;
            Pdef(\ds4).stop;
    Pdef(\ds4,
    Pbind(
        \instrument,
        \nhs1,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[2].value ,inf),
        \freq,  1,
            )).play;
    });
    //X2
    if (obj.value == 1,{
        ~f2 = 2;
        obj.value.postln;
        Pdef(\ds4).stop;
    Pdef(\ds4,
    Pbind(
        \instrument,
        \nhs1,
        \dur, Pwhite(1, 2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[2].value ,inf),
        \freq,  2,
            )).play
});
    //X3
    if (obj.value == 2,{
        ~f2 = 3;
        obj.value.postln;
        Pdef(\ds4).stop;
    Pdef(\ds4,
    Pbind(
        \instrument,
        \nhs1,
        \dur, Pwhite(1,2,inf),
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*a[2].value ,inf),
        \freq, 3,
            )).play
});
    });
});
//Sliders
//1
d = Array.fill(3, {Slider(c[3], Rect(0,100, 100, 50))});
d[0].bounds_(Rect(5, 10, 80, 20));
d[1].bounds_(Rect(5, 40, 80, 20));
d[2].bounds_(Rect(90, 10, 80, 20));
//SL_0
d[0].action_({
    |obj|
    if (Pdef(\ds3).isPlaying, {
        obj.value.postln;

         Pdef(\ds3,
    Pbind(
        \instrument,
        \bipp,
        \dur, Prand([1,0.5],inf),
        \scale, Scale.ionian,
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*d[0].value ,inf),
        \octave, [6,5].choose,
        \degree, Prand([0, 2, 4, 5, 7, 9, 11, 12],inf),
))
    });
    });
//2
d[1].action_({
    |obj|
    if (Pdef(\ds5).isPlaying, {
        obj.value.postln;
    Pdef(\ds5,
    Pbind(
        \instrument,
        \7777,
        \dur, Pseq([0.25],inf),
        \scale, Scale.ionian,
        \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]* 0.5 * d[1].value ,inf),
        \octave, [3,4].choose,
        \degree, Prand([0, 7, 5, 12, 11, 2, 3, 12, 7],inf),
))
    });
    });
//3
d[2].action_({
    |obj|
    if (Pdef(\ds5).isPlaying, {
        obj.value.postln;
        Pdef(\ds6,
    Pbind(
        \instrument,
        \Acc_of_AT,
        \dur, Prand([0.5],inf),
        \scale, Scale.ionian,
                    \amp,  Prand([1,0.77,0.7,0.72,0.8,0.82,0.88,0.9,0.92]*0.1* d[2].value   ,inf),
        \octave, [5,6],
        \degree, Prand([0, 7, 5, 12, 11, 2, 3, 12, 7],inf),
))
    });
    });
//FX1
~e1b = Button(c[3], Rect(0, 10, 10,30))
.states_([
    ["Sound1",Color.black, Color.white]
])
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    obj.value.postln;
    if(~button.value == 1, {
    if (obj.value == 0, {Synth("qElizabeth")})
    });
});
~e1b.bounds_(Rect(90,40, 40, 20));
//FX2
~e2b = Button(c[3], Rect(0, 10, 10,30))
.states_([
    ["Sound2",Color.black, Color.white]
])
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    obj.value.postln;
    if(~button.value == 1, {
    if (obj.value == 0, {Synth("17")})
    });
});
~e2b.bounds_(Rect(130,40, 40, 20));
//DRUMS
//Hi-Hat
~valhh = 1;
~hhO_F = 0;
~hhO_F = Button(c[1], Rect(10,5,50,30))
.states_([
    ["OFF",Color.gray(0.4), Color.clear],
    ["ON" , Color.red(0.6), Color.clear],
    ]).bounds_(Rect(15, 20, 50, 15))
.font_(Font("Times New Roman", 10))
.action_({
    |obj|
    if(~button.value == 1,{
    if (obj.value == 1,{
            Pdef(\hh).stop;
           Pdef(\hh, (
                    Pbind(
                    \instrument,
                    \bikeclick,
                    \dur, ~valhh,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
        });
        if(obj.value == 0, {Pdef(\hh).stop})
});
});
~hhb = Button(c[1], Rect(10,5,50,30))
.states_([
    ["HiHat1",Color.black, Color.white],
    ["Hihat2" , Color.red(0.6), Color.white],
    ["Hihat3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(15, 0, 50, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if (obj.value == 0, {
        ~valhh = 1;
         if(~hhO_F.value == 0,{
                obj.value.postln;
                Pdef(\hh, (
                    Pbind(
                    \instrument,
                    \bikeclick,
                    \dur, ~valhh,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
            });
    });
         if (obj.value == 1, {
            ~valhh = 0.5;
                obj.value.postln;
        if(~hhO_F.value ==1,{
                Pdef(\hh, (
                    Pbind(
                    \instrument,
                    \bikeclick,
                    \dur, ~valhh,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
            });
        if (obj.value == 2, {
            ~valhh = 0.25;
                obj.value.postln;
        if(~hhO_F.value == 1,{
                Pdef(\hh, (
                    Pbind(
                    \instrument,
                    \bikeclick,
                    \dur, ~valhh,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
        });
});
//BassDrum
~valbd = Prand([1, 0.5, Rest(0.25)]*2,inf);
~bdO_F = 0;
~bdO_F = Button(c[1], Rect(10,5,50,30))
.states_([
    ["OFF",Color.gray(0.4), Color.clear],
    ["ON" , Color.red(0.6), Color.clear],
    ]).bounds_(Rect(15, 55, 50, 15))
.font_(Font("Times New Roman", 10))
.action_({
    |obj|
    if(~button.value == 1,{
    if (obj.value == 1,{
            Pdef(\bd).stop;
           Pdef(\bd, (
                    Pbind(
                    \instrument,
                    \fmS,
                    \dur, ~valbd,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
        });
        if(obj.value == 0, {Pdef(\bd).stop})
});
});
~bdb = Button(c[1], Rect(10,5,50,30))
.states_([
    ["BDR1",Color.black, Color.white],
    ["BDR2" , Color.red(0.6), Color.white],
    ["BDR3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(15, 35, 50, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if (obj.value == 0, {
        ~valbd = Prand([1, 0.5, Rest(0.25)]*2,inf);
         if(~bdO_F.value == 0,{
                obj.value.postln;
                Pdef(\bd, (
                    Pbind(
                    \instrument,
                    \fmS,
                    \dur, ~valbd,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
            });
    });
         if (obj.value == 1, {
            ~valbd = Prand([1, 0.5, Rest(0.25)],inf);
                obj.value.postln;
        if(~bdO_F.value ==1,{
                Pdef(\bd, (
                    Pbind(
                    \instrument,
                    \fmS,
                    \dur, ~valbd,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
            });
        if (obj.value == 2, {
            ~valbd = Prand([1.5, 0.5, Rest(0.5)]/2,inf);
                obj.value.postln;
        if(~bdO_F.value == 1,{
                Pdef(\bd, (
                    Pbind(
                    \instrument,
                    \fmS,
                    \dur, ~valbd,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
        });
});
//Snare
~valsn = Pseq([Rest(2),0.25, 0.25, Rest(1.5)],inf);
~snO_F = 0;
~snO_F = Button(c[1], Rect(10,5,50,30))
.states_([
    ["OFF",Color.gray(0.4), Color.clear],
    ["ON" , Color.red(0.6), Color.clear],
    ]).bounds_(Rect(15, 90, 50, 15))
.font_(Font("Times New Roman", 10))
.action_({
    |obj|
    if(~button.value == 1,{
    if (obj.value == 1,{
            Pdef(\sn).stop;
           Pdef(\sn, (
                    Pbind(
                    \instrument,
                    \snfm,
                    \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                )).play;
        });
        if(obj.value == 0, {Pdef(\sn).stop})
});
});
~snb = Button(c[1], Rect(10,5,50,30))
.states_([
    ["SN1",Color.black, Color.white],
    ["SN2" , Color.red(0.6), Color.white],
    ["SN3" , Color.blue(0.6), Color.white],
]).bounds_(Rect(15, 70, 50, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if (obj.value == 0, {
        ~valsn = Pseq([Rest(2),0.25, 0.25, Rest(1.5)],inf);
         if(~snO_F.value == 0,{
                obj.value.postln;
                Pdef(\sn, (
                    Pbind(
                    \instrument,
                    \snfm,
                    \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
            });
    });
         if (obj.value == 1, {
        ~valsn = Pseq([Rest(2), 0.125, Rest(0.125), 0.25, 0.25,Rest(0.25), 0.25, 0.25, Rest(0.5) ],inf);
                obj.value.postln;
        if(~snO_F.value ==1,{
                Pdef(\sn, (
                    Pbind(
                    \instrument,
                    \snfm,
                    \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
            });
        if (obj.value == 2, {
        ~valsn = Prand([0.5,Rest(0.5), 0.5]/2,inf);
                obj.value.postln;
        if(~snO_F.value == 1,{
                Pdef(\sn, (
                    Pbind(
                    \instrument,
                    \snfm,
                    \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ))
    });
        });
});
//Break_Button
~breb = Button(c[1], Rect(10,5,50,30))
.states_([
    ["֍",Color.black, Color.white],
    ["BREAK" , Color.red(0.6), Color.white],
]).bounds_(Rect(15, 115, 50, 20))
.font_(Font("Times New Roman", 12))
.action_({
    |obj|
    if ( ~button.value == 1, {
    if (obj.value == 1, {(
            Pdef(\sn).reset;
Pdef(\sn,
    Pbind(
        \instrument,
        \snfm,
                \dur, Pseq([0.125, 0.125, 0.25, 0.25, 0.125/2,0.125/2, 0.125, 0.25, 0.25],2),
                    \amp, Pwhite(0.2, 0.4, inf),
)
);
            {obj.value = 0;
                if (~button.value == 1,{
                   if ( obj.value == 0, {(
                    Pdef(\sn).reset.stop;
                    Pdef(\sn, (
                    Pbind(
                    \instrument,
                    \snfm,
                    \dur, ~valsn,
                        \amp, Pwhite(0.2, 0.4, inf)
                    )
                ));
                    Pdef(\sn).play;
                );
                })});
        }.defer(3));
        });
    })
});
//POEMS__DK_FLAG
//Harmonie
~p1b = Button(c[2], Rect(0, 10, 10,30))
.states_([
    ["s",Color.clear, Color.clear]
])
.font_(Font("Times New Roman", 18))
.action_({
    |obj|
    obj.value.postln;
    if (obj.value == 0, {Synth("harm")})
});
~p1b.bounds_(Rect(0,0, 40, 25));
//Horns
~p2b = Button(c[2], Rect(0, 10, 10,30))
.states_([
    ["s",Color.clear, Color.clear]
])
.font_(Font("Times New Roman", 18))
.action_({
    |obj|
    obj.value.postln;
    if (obj.value == 0, {Synth("ghorns")})
});
~p2b.bounds_(Rect(60,45, 115, 25));
(
SynthDef("dSS1s",
    {
        |amp = 0.5, freq = 2|
        var env , out, sig, sig1, sig2, sig3, amp1, sum, sum1, sum2, sum3;
        sum = 0;
        sum1 = 0;
        sum2 = 0;
        sum3 = 0;
        amp1 = 0.1;
        5.do{
            sig = LFTri.ar(freq * Rand(100, 333), Rand(0.0, 1.0), Rand(0.05, 1.0));
        sum = sum+ sig * 1.5;
        };
        5.do{
            sig1 = SinOsc.ar(freq * ExpRand(666, 1111), Rand(0.0, 1.0), Rand(0.1, 0.2));
            sum1 = sum1 + sig1* 2;
            3.do{sig2 = LFCub.ar(freq * ExpRand(88, 444), Rand(0.0, 1.0), Rand(0.1, 0.2)*66);
                sum2 = sum2+sig2
            };
        };
            5.do{
            sig3 =  BPF.ar(PinkNoise.ar(1), Rand(1000, 6666), Rand(0.1, 1.0));
            sum3 = sum3 + (sig3 * 1.5 * sig2);
            };
        env = Env.perc(1.33, 2.88, 0.88, curve:8).kr(doneAction:2);
        out = LPF.ar((sum + sum1 + sum2), 6000);
        out = BPeakEQ.ar(out+ (sum3), 200, 2, 12)* 0.1;
        out = out * env* amp * 0.01;
        Out.ar([0, 1], out);
    }
).add
);
(
SynthDef("a15", {
    |freq = 440, amp = 0.5| //SET_ARGUMENTS
    var sig, env, out, temp, temp1 , sum, sum1; //VARIABLES
    sum = 0; //VAR_INITIALIZATION
    sum1 = 0; // VAR_INITIALIZATION
    //INTERATION_*5(do)                ExpRand-Rand=Generates_Random_Numbers(Exp-->Exponential)
    5.do { temp = SinOsc.ar(freq * ExpRand(0.2, 0.7), mul: Rand(0.05,amp / 5/*LESS_LOUDER_THAN temp1*/));
        sum = (temp + sum) *
(LFPulse.kr([Rand(0.5, 7), Rand(0.5, 7)], Rand(0.0, 1.0), Rand(0.0, 1.0), 2)); //EVERY_-DO-_A_TEMP_IS_ADDED_TO_SUM
    };
    //INTERATION_*5(do)___SAME_AS_BEFORE
    5.do {
        temp1 =  LFPulse.ar(freq * ExpRand(1.0, 7.0), Rand(0.0, 1.0), Rand(0.0, 1.0), mul: Rand(0.05, amp/4));
        sum1 = (temp1 + sum1) *
(LFPulse.kr([Rand(0.5, 7), Rand(0.5, 7)], Rand(0.0, 1.0), Rand(0.0, 1.0), 2));
    };
    //Envelope ---Attack_Decay_Sustain_Release___Gate-If=1, Stays_on_the_Sus_Level(0.8)_If=0,releaseTime-Synth_Closes
    env =  EnvGen.ar(Env.adsr(1.66, 0.066, 0.8, 1.33),Line.kr(1, 0, 2),doneAction:2);//Sustain_for_0.2_Sec
    out = (sum + sum1) * 0.05 * env; //MULTIPLY----Envelope*Signal
    out = LPF.ar(out, 1500); //LOWPASS_FILTER_AT_1500HZ
    out =  BPeakEQ.ar(out, 800, 2, 3); //PEAKFILTER_AT_800HZ_WIDE(rq)_+3DB
    out = out + (FreeVerb.ar(out, 1.0, 0.666)*0.666);//Using_Reverb_like_An_AUX_(Mixing_Desk)
    Out.ar/*Out=Class_WriteAsignalToAbus*/
    (0, Pan2.ar(out* amp* 0.666, LFNoise0.kr(4).range(0.0, 1.0)))} //RANDOM_PANNING(Class--Pan2)_CHANGES---4TIMES/SEC_
).add
);
(
SynthDef("nhs1",{
    |amp = 0.5, freq = 1|
    var sig , env, temp, sum, out;
    sum = 0;//Using_interation_PulseWave__&Randomize
    sig = 10.do {temp = Pulse.ar(freq * ExpRand(1000, 3333), Line.kr(1, 0.1, 3), LFPulse.kr(Rand(3,12),Rand(0.1 , 0.99), Rand(0.0, 1.0)));
        sum = sum + temp;
    };
    env = Env.perc(1.5, 2).kr(doneAction:2);
    out = sum * env* amp* 0.125;//TooLoudSo*0.125
    out = BPF.ar(out, 2555, 1);//Filtering
    out = out + (FreeVerb.ar(out, 1.0, 1.0, 1.0));//Reverb
    Out.ar([0,1], out* (1/pi));
}).add
);
(
~buffer = Buffer.read(s,"C:/Users/Flud666/Documents/Jason SK/.scd/GUI/Rødgrød_med_Fløde/1rød grød med fløde.wav");
SynthDef("rod", {
    var sig, l, out;
    sig = PlayBuf.ar(2, ~buffer.bufnum, 2, loop: 1);
    l = FFT(LocalBuf(2048), sig);//From_Freq_to_Time_||Fourier||
    l = PV_BinScramble( l, Line.kr(0 , 0.366, Rand(0.5, 2)) , 0.266, 0.666 ); //RandomisesOrderOfBinsInTheSample's(Sampling)
    out = 2*IFFT(l)!2* Env.perc(0.5, 4.0).kr(doneAction:2);//Envelope
    out = (out + (FreeVerb.ar(out, 1.0, 0.6, 1.0))) * 0.666;
    Out.ar(0,  out)
}).add;
);
(
~buffer1 = Buffer.read(s,"C:/Users/Flud666/Documents/Jason SK/.scd/GUI/Rødgrød_med_Fløde/2Harmonie.wav");
SynthDef("harm", {
    var sig, l, out;
    sig = PlayBuf.ar(2, ~buffer1.bufnum, 0.5);
    l = FFT(LocalBuf(2048), sig);//From_Freq_to_Time_||Fourier||
    l = PV_BinScramble( l, Line.kr(0, 0.666/3.5, Rand(0.01, 0.277)) , 0.166, 0.666 ); //RandomisesOrderOfBinsInTheSample's(Sampling)
    out = 2*IFFT(l)!2* EnvGen.kr(Env.adsr(0.5, 1, 0.8, 5),Line.kr(1, 0, 17),doneAction:2);
    out = out + (FreeVerb.ar(out, 1.0, 1.0, 1.0 ))* 0.466;
    Out.ar(0, out );//Envelope
}).add;
);
(
~buffer2 = Buffer.read(s,"C:/Users/Flud666/Documents/Jason SK/.scd/GUI/Rødgrød_med_Fløde/3Gold_Horns.wav");
SynthDef("ghorns", {
    var sig, l, out;
    sig = PlayBuf.ar(2, ~buffer2.bufnum, 0.5);
    l = FFT(LocalBuf(2048), sig);//From_Freq_to_Time_||Fourier||
    l = PV_BinScramble( l, Line.kr(0, 0.666/5, Rand(0.01, 0.02)), 0.166, 0.666 ); //RandomisesOrderOfBinsInTheSample's(Sampling)
    out = 2*IFFT(l)!2* EnvGen.kr(Env.adsr(0.5, 1, 0.8, 5),Line.kr(1, 0, 17),doneAction:2);
    out = (out + (FreeVerb.ar(out, 1.0, 1.0, 1.0 )))* 0.466;
    Out.ar(0, out );//Envelope
}).add;
);
(
SynthDef("bipp",
    {
        |freq = 440, amp = 0.5|
        var sig, sig1, sig2, env, env1, env2, temp, sum, out;
        sum = 0;//Initialization
        10.do{
            temp = LFCub.ar(//Detuning______AndRandPhase
                freq * {Rand(0.9899, 1.0105)!2}, Rand(0.1,0.9)
        )};///////////////////vvvvvvvvvvv__ADSR_ENV______________V___1SEC_SUSTAIN
        env = EnvGen.kr(Env.adsr(0.03, 0.1, 0.555, 0.01), Line.kr(1,0, 1),doneAction:2);
        sum = sum + temp * 0.88;//TooLoud-->* 0.88
        out = sum ;
        out = LPF.ar(HPF.ar(out, 200),1000);
        out = out + FreeVerb.ar(out, 1.0 , 0.9, 0.9, 0.4)* 0.444;//Reverb
        out = out *env *amp * (1.25/pi);
        Out.ar(0, Pan2.ar(out , 0.366));
    }
).add
);
(
SynthDef.new("7777",
    {
        arg freq = 140, amp = 1, pan = 0;
        var s, env, end;
        s = LPF.ar(Saw.ar(([freq, freq/2 ])),400);
        env = Env.perc(0.02,1.4,curve:-4).kr(doneAction:2);
        end = s*env;
        Out.ar(0,Pan2.ar(end* amp * 1.5/pi ,pan))};
).add
);
(
SynthDef("bikeclick", {
    |amp = 0.5|
    var sig, sig1, env, out, out1;

    sig = WhiteNoise.ar(0.5);
    sig1=  BrownNoise.ar(0.2);
    env = Env.perc(0.01, 0.05).kr(doneAction:2);
    out = sig *env * Rand(0.7, 1.0);
    out1 = BPF.ar(sig1, 11000, 0.2);
    out = BPF.ar(out,10500, 0.1);
    out = out1 + out;
    out = out + (FreeVerb.ar(out, 1.0, 0.666,0.366));
    Out.ar(0, Pan2.ar(out * amp* 1.5, 0.766));
}).add
);
(
SynthDef("fmS", {
    |freq = 220, amp = 0.5|
    var fr, env, sig, out;
    fr = EnvGen.ar(Env.new([2020, 100, 46], [0.003, 0.1], curve: 0));//Frequency_Modulation
    sig = FSinOsc.ar(fr)* fr * 0.001; //Fast_Sin_Oscillator_so-->Freq/Pops
    sig = RLPF.ar(sig, 566,0.4); //To_Much_Treble_+Timbre
    sig = BPeakEQ.ar(sig, 100, 0.5, 8.88);
    env = Env.perc (0.001, 0.188).kr(doneAction:2);//Envelope
    out = sig * env * amp ;
    out = FreeVerb.ar(out, 0.23, 0.266, 0.5);
    Out.ar([0,1], out)
}).add;
);
(
SynthDef("snfm", {
    |amp = 0.5|
    var sig, env, out;
    sig = HPF.ar(ClipNoise.ar(0.5), 2200);
    sig = sig + FSinOsc.ar(EnvGen.kr(Env([2030, 200, 250], [0.003, 0.05])),Rand(0.1, 1.0),0.3);
    sig = sig + HPF.ar(GrayNoise.ar(0.4),100, 0.5);
    sig = HPF.ar(sig, 188.88);
    sig = LPF.ar(sig, 10888);
    env = Env.perc(0.001, 0.1, curve:-6).kr(doneAction:2);
    out = env * sig;
    out =   out + FreeVerb.ar(out, 1.0)* 0.333 ;
    Out.ar(0, Pan2.ar(out*amp,0))
}).add
);
(
SynthDef("Acc_of_AT", {
  |freq = 440, amp = 0.5|
    var sig, env, out;
    sig = Pulse.ar(freq, Rand(0.444, 0.666));
    sig = sig + Pulse.ar(freq*Rand(0.99, 1.01), Rand(0.4, 0.666), 0.5);
    sig = sig + Pulse.ar(freq*Rand(0.99, 1.01), Rand(0.666, 0.9), 0.25);
    env = EnvGen.ar(Env.new ([0, 0.5, 0.1, 0.766, 0.0], [0.466, 0.02, 0.05, 0.0666]), Line.kr(1.0, 0.0, 1.333, doneAction:2));
    out = sig * env * amp* 0.777;
    out = HPF.ar(out, 200);
    out = LPF.ar(out, 6500);
    out = BPeakEQ.ar(out, 1000, db: -6);
    out = BPeakEQ.ar(out, 366, 2, db: 3);
    out =  out + (FreeVerb.ar(out, 1.0, 0.666));
    Out.ar(0, Pan2.ar(out, Rand(-0.95, -0.8)));
}
).add
);
(
SynthDef("qElizabeth", {
    |freq = 100, amp = 0.5|
    var sig, env, out, xs;
    sig = WhiteNoise.ar(0.25);
    sig = BPF.ar(sig, Env([10000, 100, 955, 0.1], [4, 0.5, 3.5]).kr, 0.1);//FreqModulatedFilter
    env = EnvGen.kr(Env.adsr(0.6, 2, 0.5, 2.666), Line.kr(1, 0, 5.5), doneAction:2);//ADSR_Envelope_5.5SecSustain(Line)
    xs = Array.fill(12, { | i| i +1 }).postln;//Array_Integers_from____1..12
    sig = sig +  LFCub.ar(xs.value.choose*freq, Rand(0.0, 1.0), 0.322) + SinOsc.ar(xs.value.choose*freq, Rand(0.0, 1.0), 0.222);
    //AnIntegerPickFromTheArray_^^^^^^^_AndMultipliesWithFreq=100Hz,
    out = sig * env* LFNoise0.kr(2)* amp;//LFNoise0_StepNoise_"Bumps"InTheSound
    out = out +(FreeVerb.ar(out, 1.0, 1.0, 1.0)* 2);//LotOFReverb
    Out.ar([0, 1], out* 0.466);
}).add
);
(
SynthDef.new("17",
    {arg freq = 440, amp = 1, pan=0, tone4 = 4;
        var s1, s2, env, out;
        s1 = {Impulse.ar(freq*Rand(0.5, 2), SinOsc.ar(6,0.5,1), 1,Dust2.ar(freq*2,mul:0.4);  )};
        env = {Env.perc(1.1,3.5).kr(doneAction:2)};
        out = (s1);
        out = (out + (FreeVerb.ar(out, 1.0, 1.0, 0.6)))*env* 0.222;
        Out.ar(0,Pan2.ar(out*amp,pan).wrap2*1)}
).add
);

)


