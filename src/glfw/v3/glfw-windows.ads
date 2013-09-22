--------------------------------------------------------------------------------
-- Copyright (c) 2013, Felix Krause <contact@flyx.org>
--
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted, provided that the above
-- copyright notice and this permission notice appear in all copies.
--
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
-- WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
-- MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
-- ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-- ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
-- OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--------------------------------------------------------------------------------

with System;

with Glfw.Input.Mouse;
with Glfw.Input.Keys;
with Glfw.Monitors;

private with Ada.Finalization;

package Glfw.Windows is

   type Window is tagged private;

   type Callback is (Position, Size, Close, Refresh, Focus, Iconify,
                     Framebuffer_Size, Mouse_Button, Mouse_Position,
                     Mouse_Scroll, Mouse_Enter, Key, Char);

   procedure Init (Object        : not null access Window;
                   Width, Height : Natural;
                   Title         : String; -- interpreted as UTF-8
                   Monitor       : Monitors.Monitor;
                   Share_Resources_With : access Window'Class := null);

   procedure Enable_Callback (Object : not null access Window;
                              Subject : Callback);

   procedure Position_Changed (Object : not null access Window;
                               X, Y : Integer) is null;
   procedure Size_Changed (Object : not null access Window;
                           Width, Height : Natural) is null;
   procedure Closing (Object : not null access Window) is null;
   procedure Refresh (Object : not null access Window) is null;
   procedure Focus_Changed (Object : not null access Window;
                            Focussed : Boolean) is null;
   procedure Iconification_Changed (Object : not null access Window;
                                    Iconified : Boolean) is null;
   procedure Framebuffer_Size_Changed (Object : not null access Window;
                                       Width, Height : Natural) is null;
   procedure Mouse_Button_Changed (Object  : not null access Window;
                                   Button  : Input.Mouse.Button;
                                   Action  : Input.Mouse.Button_Action;
                                   Mods    : Input.Keys.Modifiers) is null;
   procedure Mouse_Position_Changed (Object : not null access Window;
                                     X, Y   : Input.Mouse.Coordinate) is null;
   procedure Mouse_Scrolled (Object : not null access Window;
                             X, Y   : Input.Mouse.Scroll_Offset) is null;
   procedure Mouse_Entered (Object : not null access Window;
                            Action : Input.Mouse.Enter_Action) is null;
   procedure Key_Changed (Object   : not null access Window;
                          Key      : Input.Keys.Key;
                          Scancode : Input.Keys.Scancode;
                          Action   : Input.Keys.Action) is null;
   procedure Character_Entered (Object : not null access Window;
                                Char   : Wide_Wide_Character) is null;

private
   type Window is new Ada.Finalization.Controlled with record
      Handle : System.Address;
   end record;
end Glfw.Windows;