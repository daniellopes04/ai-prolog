point(X, Y).
seg(Point1, Point2).
triangle(Point1, Point2, Point3).

rectangle(Point1, Point2, Point3, Point4).
rectangle(Point1, Width, Height).

square(Point1, Width).
square(rectangle(Point1, Width, Width)).

circle(Point1, Radius).

vertical(seg(point(X, Y), point(X, Y1))).
horizontal(seg(point(X, Y), point(X1, Y))).

regular(rectangle(Point1, Point2, Point3, Point4)) :-
    vertical(seg(Point1, Point2)),
    vertical(seg(Point3, Point4)),
    horizontal(seg(Point2, Point3)),
    horizontal(seg(Point1, Point4)).
