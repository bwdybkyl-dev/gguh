import '../../data/models/call_model.dart';
abstract interface class RealtimeCallProvider { Future<String> createRoom({required String callId}); Future<void> joinRoom(String roomId); Future<void> leaveRoom(String roomId); }
class CallService { const CallService(this._provider); final RealtimeCallProvider _provider; Future<String> prepareRoom(CallModel call)=>_provider.createRoom(callId:call.id); Future<void> join(String roomId)=>_provider.joinRoom(roomId); Future<void> leave(String roomId)=>_provider.leaveRoom(roomId); }
