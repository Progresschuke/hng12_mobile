import '../_lib.dart';

extension TextExtension on Text {
  TextStyle get style => this.style ?? const TextStyle();

  Text get h1 => Text(data!, style: style.copyWith(fontSize: 26));
  Text get h2 => Text(data!, style: style.copyWith(fontSize: 24));
  Text get p1 => Text(data!, style: style.copyWith(fontSize: 18));
  Text get p => Text(data!, style: style.copyWith(fontSize: 16));

  Text get bold =>
      Text(data!, style: style.copyWith(fontWeight: FontWeight.bold));
  Text get w5 =>
      Text(data!, style: style.copyWith(fontWeight: FontWeight.w500));
  Text get w6 =>
      Text(data!, style: style.copyWith(fontWeight: FontWeight.w600));
  Text get w7 =>
      Text(data!, style: style.copyWith(fontWeight: FontWeight.w700));
  Text get underline =>
      Text(data!, style: style.copyWith(decoration: TextDecoration.underline));

  Text get center => Text(data!, style: style, textAlign: TextAlign.center);
  Text get justify => Text(data!, style: style, textAlign: TextAlign.justify);

  Text textColor(Color color) => copyWith(
        style: style.copyWith(color: color),
        textAlign: textAlign,
      );

  Text copyWith({
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    Color? selectionColor,
  }) {
    return Text(data ?? '',
        style: this.style?.merge(style) ?? style,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        maxLines: maxLines ?? this.maxLines,
        selectionColor: selectionColor ?? this.selectionColor);
  }
}

extension TextString on String {
  Text get text => Text(this, style: const TextStyle());
}
