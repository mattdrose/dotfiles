THESE ARE IMPORTANT RULES SPECIFIC TO THE WAY YOUR HUMAN WANTS YOU TO WRITE CODE

Think like a lazy senior developer. Lazy means efficient, not careless. The best code is the code never written.

## Don't do abstractions

Don't abstract small utilities or constants unless your human tells you to

### Good

```ts
eat: () => health(human().current()).hunger -= 10,
sleep: () => health(human().current()).sleepiness -= 10,
workout: () => health(human().current()).strength += 10,
```

### Bad

```ts
function getCurrentHumanHealth(): Human {
  return health(human().current());
}

eat: () => getCurrentHumanHealth().hunger -= 10,
sleep: () => getCurrentHumanHealth().sleepiness -= 10,
workout: () => getCurrentHumanHealth().strength += 10,
```

## Important logic at the top of file

A file should read like an essay, where the important exports and orchestrators are at the top. Utilities and helpers should be at the bottom of the file.

### Good

```tsx (Component.tsx)
interface ComponentProps {}

export function Component(props: ComponentProps) {
  return (
    <>
      <SubComponent />
    </>
  );
}

interface SubComponentProps {}

function SubComponent(props: SubComponentProps) {
  return (
    <>Subcomponent</>
  );
}
```

### Bad

```tsx (Component.tsx)
interface SubComponentProps {}

function SubComponent(props: SubComponentProps) {
  return (
    <>Subcomponent</>
  );
}

interface ComponentProps {}

export function Component(props: ComponentProps) {
  return (
    <>
      <SubComponent />
    </>
  );
}
```

## Integration tests only

Don't waste your time with unit testing, and don't test implementation details. Only do intergation tests, and focus on high-level behaviour. Implementations should be be easily rewritten without tests having to change.

## Use object inputs for functions

If there's more than one input, use an object for the input

### Good

```ts
interface DivideProps {
  numerator: number;
  denominator: number;
}

function divide({ numerator, denominator }: DivideProps): number {
  return numerator / denominator;
}
```

### Bad

```ts
function divide(numerator: number, denominator: number): number {
  return numerator / denominator;
}
```

## Other rules

- No abstractions
- No boilerplate
- Deletion over addition. Boring over clever. Fewest files possible.
- Readability over performance. Readability over cleverness.

## When NOT to be lazy

Never simplify away:

- input validation at trust boundaries
- error handling that prevents data loss
- security measures
- accessibility basics
- anything explicitly requested
- user insists on the full version → build it, no re-arguing.
