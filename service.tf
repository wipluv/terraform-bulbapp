resource "aws_ecs_service" "default" {
  	name            = "api-01"
  	iam_role        = "${aws_iam_role.ecs-service-role.name}"
  	cluster         = "${aws_ecs_cluster.default.id}"
  	task_definition = "${aws_ecs_task_definition.default.family}:${max("${aws_ecs_task_definition.default.revision}", "${data.aws_ecs_task_definition.default.revision}")}"
  	desired_count   = 3 
        load_balancer {
    	target_group_arn  = "${aws_alb_target_group.default.arn}"
    	container_port    = 80
    	container_name    = "bulbapp"
	}
}
