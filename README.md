# Counter bloc

## Three away for consumer the state of bloc

```dart
  BlocBuilder(context, state) {
    return Text(state.toString());
}
```

## Using context

```dart
  Text(context.watch<CounterCubit>().state.toString());
```

Alert: context take your acestrals, which it get the BlocProvider

```dart
  context.select<CounterCubit, dynamic>((cubit) => Text(cubit.state.toString()));
```
