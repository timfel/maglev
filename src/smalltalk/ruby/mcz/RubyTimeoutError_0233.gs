
set class RubyTimeoutError
category: 'as yet unclassified'
classmethod:
comment
   "this class is deprecated"

%


set class RubyTimeoutError
category: 'as yet unclassified'
classmethod:
timeout: aNumber do: aBlock
	|sem process val|
	sem := Semaphore new.
	process :=
		[val := aBlock value.
		sem signal] fork.
	(sem waitForSeconds: aNumber) ifFalse:
		[process terminate.
		self signal].
	^ val

%

