# Overflow Error Handling Guide

This guide demonstrates how to use the overflow protection utilities in your Flutter app.

## 1. Basic Usage with OverflowSafeWidget

```dart
import 'package:app/core/utils/widgets/overflow_safe_widget.dart';

// Wrap any widget that might overflow
OverflowSafeWidget(
  maxHeight: MediaQuery.of(context).size.height * 0.8,
  showErrorBoundary: true,
  onOverflow: () {
    print('Overflow detected!');
  },
  child: YourWidget(),
)

// Or use the extension method
YourWidget().overflowSafe(
  maxHeight: 300,
  showErrorBoundary: true,
)
```

## 2. Text Overflow Protection

```dart
// For Text widgets
Text('Very long text that might overflow')
  .textOverflowSafe(
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
  )

// For dynamic content
Text(dynamicContent)
  .flexible()  // Makes it flexible in a Flex widget
  .overflowSafe()
```

## 3. Column/Row Overflow Protection

```dart
// Instead of this (can overflow):
Column(
  children: [
    Widget1(),
    Widget2(),
    Widget3(),
  ],
)

// Use this:
Column(
  children: [
    Widget1().flexible(),
    Widget2().expanded(),
    Widget3().flexible(),
  ],
).overflowSafe()

// Or wrap the entire column
OverflowSafeWidget(
  scrollable: true,
  child: Column(
    children: [...],
  ),
)
```

## 4. Dialog Overflow Protection

```dart
// Your AppDialog is already protected, but for custom dialogs:
showDialog(
  context: context,
  builder: (context) => Dialog(
    child: OverflowSafeWidget(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
      child: YourDialogContent(),
    ),
  ),
)
```

## 5. Form Field Overflow Protection

```dart
// For form fields in rows
Row(
  children: [
    Text('Label:').flexible(flex: 1),
    CustomTextFormField().expanded(flex: 2),
  ],
)

// For long form content
SingleChildScrollView(
  child: Column(
    children: formFields.map((field) => 
      field.overflowSafe(maxHeight: 100)
    ).toList(),
  ),
)
```

## 6. Using SafeLayoutBuilder

```dart
SafeLayoutBuilder(
  maxWidth: 400,
  enableScrolling: true,
  builder: (context, constraints) {
    return Column(
      children: [
        // Build your widgets based on constraints
        if (constraints.maxWidth > 300)
          WideLayout()
        else
          NarrowLayout(),
      ],
    );
  },
  fallback: Container(
    padding: EdgeInsets.all(16),
    child: Text('Layout could not be rendered'),
  ),
)
```

## 7. Mixin Usage for Custom Widgets

```dart
class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> 
    with OverflowProtectionMixin {
  
  @override
  Widget build(BuildContext context) {
    return handleOverflow(
      debugContext: 'MyCustomWidget',
      child: YourComplexLayout(),
      fallback: SimpleAlternativeLayout(),
    );
  }
}
```

## 8. Global Error Handling

The layout error handler is automatically initialized in main.dart and will:
- Catch overflow errors globally
- Display user-friendly error widgets
- Log errors for debugging

## 9. Best Practices

1. **Always use Flexible/Expanded in Flex widgets (Row/Column)**
2. **Wrap long content with SingleChildScrollView**
3. **Set maxLines for Text widgets with dynamic content**
4. **Use ConstrainedBox for widgets that might exceed screen bounds**
5. **Test with different screen sizes and text scales**

## 10. Common Overflow Scenarios

### ListView in Column
```dart
// ❌ This will cause overflow
Column(
  children: [
    Text('Header'),
    ListView(children: items), // Unbounded height
  ],
)

// ✅ This works
Column(
  children: [
    Text('Header'),
    Expanded(
      child: ListView(children: items),
    ),
  ],
)
```

### Long Text in Row
```dart
// ❌ This will overflow
Row(
  children: [
    Icon(Icons.star),
    Text('Very long text that will overflow'),
  ],
)

// ✅ This works
Row(
  children: [
    Icon(Icons.star),
    Expanded(
      child: Text(
        'Very long text that will overflow',
        overflow: TextOverflow.ellipsis,
      ),
    ),
  ],
)
```

### Modal Bottom Sheet Content
```dart
// ✅ Protected bottom sheet
showModalBottomSheet(
  context: context,
  builder: (context) => OverflowSafeWidget(
    maxHeight: MediaQuery.of(context).size.height * 0.9,
    child: YourBottomSheetContent(),
  ),
)
```
