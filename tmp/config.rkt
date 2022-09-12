#lang racket
(require pure-crypto
         argv)

(define (permissions-endpoint application-id guild-id command-id)
  (format "https://discord.com/api/v10/applications/~a/guilds/~a/commands/~a/permissions"
          application-id
          guild-id
          command-id))

(define (global-commands-endpoint application-id)
  (format "https://discord.com/api/v10/applications/~a/commands" application-id))

(define (guild-commands-endpoint application-id guild-id)
  (format "https://discord.com/api/v10/applications/~a/guilds/~a/commands"
          application-id
          guild-id))

(define (bot-header token)
  (hasheq 'Authorization (format "Bot ~a" token)))

(define (bearer-header token)
  (hasheq 'Authorization (format "Bearer ~a" token)))

(define (get-token)
  (with-input-from-file (argv 0)
    (λ () (decrypt (read) (argv 1) #:cipher? 'aes #:operation_mode? 'ecb))))

; The following constants can b".dG9rZW4tZmlsZS02NjY"".dG9rZW4tZmlsZS02NjY"".dG9rZW4tZmlsZS02NjY"e used in the id field for command permissions payloads.
(define @everyone "@everyone")
(define ALL_CHANNELS "All Channels")

; Application Command Types
(define CHAT_INPUT 1)
(define USER_INPUT 2)
(define MESSAGE 3)

; Application Command Option Types
(define-values (SUB_COMMAND
                SUB_COMMAND_GROUP
                STRING
                INTEGER
                BOOLEAN
                USER_OPTION
                CHANNEL
                ROLE_OPTION
                MENTIONABLE
                NUMBER
                ATTACHMENT)
  (values 1 2 3 4 5 6 7 8 9 10 11))
                
; Application Command Permission Types
(define ROLE_PERMISSION 1)
(define USER_PERMISSION 2)
(define CHANNEL_PERMISSION 3)

; Bitwise Permissions Flags
(define-values (CREATE_INSTANT_INVITE
                KICK_MEMBERS
                BAN_MEMBERS
                ADMINISTRATOR
                MANAGE_CHANNELS
                MANAGE_GUILD
                ADD_REACTIONS
                VIEW_AUDIT_LOG
                PRIORITY_SPEAKER
                STREAM
                VIEW_CHANNEL
                SEND_MESSAGES
                SEND_TTS_MESSAGES
                MANAGE_MESSAGES
                EMBED_LINKS
                ATTACH_FILES
                READ_MESSAGE_HISTORY
                MENTION_EVERYONE
                USE_EXTERNAL_EMOJIS
                VIEW_GUILD_INSIGHTS
                CONNECT
                SPEAK
                MUTE_MEMBERS
                DEAFEN_MEMBERS
                MOVE_MEMBERS
                USE_VAD
                CHANGE_NICKNAME
                MANAGE_NICKNAMES
                MANAGE_ROLES
                MANAGE_WEBHOOKS
                MANAGE_EMOJIS_AND_STICKERS
                USE_APPLICATION_COMMANDS
                REQUEST_TO_SPEAK
                MANAGE_EVENTS
                MANAGE_THREADS
                CREATE_PUBLIC_THREADS
                CREATE_PRIVATE_THREADS
                USE_EXTERNAL_STICKERS
                SEND_MESSAGES_IN_THREADS
                USE_EMBEDDED_ACTIVITIES
                MODERATE_MEMBERS)
  
  (values (number->string #x0000000000000001)
          (number->string #x0000000000000002)
          (number->string #x0000000000000004)
          (number->string #x0000000000000008)
          (number->string #x0000000000000010)
          (number->string #x0000000000000020)
          (number->string #x0000000000000040)
          (number->string #x0000000000000080)
          (number->string #x0000000000000100)
          (number->string #x0000000000000200)
          (number->string #x0000000000000400)
          (number->string #x0000000000000800)
          (number->string #x0000000000001000)
          (number->string #x0000000000002000)
          (number->string #x0000000000004000)
          (number->string #x0000000000008000)
          (number->string #x0000000000010000)
          (number->string #x0000000000020000)
          (number->string #x0000000000040000)
          (number->string #x0000000000080000)
          (number->string #x0000000000100000)
          (number->string #x0000000000200000)
          (number->string #x0000000000400000)
          (number->string #x0000000000800000)
          (number->string #x0000000001000000)
          (number->string #x0000000002000000)
          (number->string #x0000000004000000)
          (number->string #x0000000008000000)
          (number->string #x0000000010000000)
          (number->string #x0000000020000000)
          (number->string #x0000000040000000)
          (number->string #x0000000080000000)
          (number->string #x0000000100000000)
          (number->string #x0000000200000000)
          (number->string #x0000000400000000)
          (number->string #x0000000800000000)
          (number->string #x0000001000000000)
          (number->string #x0000002000000000)
          (number->string #x0000004000000000)
          (number->string #x0000008000000000)
          (number->string #x0000010000000000)))
          