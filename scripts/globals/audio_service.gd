extends Node

static var provider : AudioServiceProvider
static var provider2d : AudioServiceProvider2D

func play(stream : AudioStream) -> AudioStreamPlayer:
	return provider.request(stream)

func play2d(stream : AudioStream, position : Vector2) -> AudioStreamPlayer2D:
	return provider2d.request(stream,position)
