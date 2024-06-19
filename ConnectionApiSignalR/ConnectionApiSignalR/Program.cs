using Microsoft.AspNetCore.SignalR.Client;

var connection = new HubConnectionBuilder()
    .WithUrl("https://localhost:44301/notificaciones")
    .Build();

await connection.StartAsync();

connection.On<List<object>>("SendNotificacion", (notificacion) => {
    string? message = notificacion[0] as string;
    List<string>? users = notificacion[1] as List<string>;

    Console.WriteLine("Mensaje: " + message);
    Console.WriteLine("Usuarios:");
    foreach (var user in users)
    {
        Console.WriteLine("- " + user);
    }
});

Console.WriteLine("Esperando notificaciones...");
Console.ReadLine();
