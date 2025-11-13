/// @function enumFromString
/// @description
/// Converts a [String] value into an enum constant of type [T].
/// Performs a case-insensitive comparison to find a matching enum value.
///
/// @remarks
/// If no matching enum value is found or the input is `null`,
/// the function safely returns the provided [defaultValue].
///
/// @param {String?} value
/// The string value to be converted into an enum constant.
///
/// @param {List<T>} values
/// A list of possible enum values to search through.
///
/// @param {T} defaultValue
/// The default enum value to return if no match is found.
///
/// @return {T}
/// The matching enum constant, or [defaultValue] if no match exists.
T enumFromString<T>(String? value, List<T> values, {required T defaultValue}) {
  if (value == null) return defaultValue;

  try {
    // Match by comparing enum name (case-insensitive)
    return values.firstWhere(
      (v) => value.toLowerCase() == v.toString().split('.').last.toLowerCase(),
      orElse: () => defaultValue,
    );
  } catch (_) {
    return defaultValue;
  }
}
