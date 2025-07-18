import 'package:chefio_app/core/widgets/follow_button_consumer.dart';
import 'package:chefio_app/features/notifiactions/domain/notification_entity.dart';
import 'package:chefio_app/features/notifiactions/presentation/view/widgets/notification_user_with_message.dart';
import 'package:flutter/material.dart';

class NotificationFollowItem extends StatelessWidget {
  const NotificationFollowItem({
    super.key,
    required this.notificationEntity,
  });
  final NotificationEntity notificationEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NotificationUserWithMessage(
            notificationEntity: notificationEntity,
          ),
        ),
        FollowButtonConsumer(
          chefId: notificationEntity.chefId,
          isFollowing: notificationEntity.isFollowing!,
        )
      ],
    );
  }
}
